package test

import (
	"fmt"
	"testing"
	"time"

	http_helper "github.com/gruntwork-io/terratest/modules/http-helper"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestHelloWorldAppExample(t *testing.T) {
	t.Parallel()

	opts := &terraform.Options{
		TerraformDir: "../examples/hello-world-app",
		Vars: map[string]interface{}{
			"mysql_config": map[string]interface{}{
				"address": "mocked-server-address-for-test",
				"port":    3306,
			},
			"environment": fmt.Sprintf("test-%s", random.UniqueId()),
		},
	}
	defer terraform.Destroy(t, opts)
	terraform.InitAndApply(t, opts)

	albDNSName := terraform.OutputRequired(t, opts, "alb_dns_name")
	url := fmt.Sprintf("http://%s", albDNSName)

	expectedStatus := 200
	expectedBody := `<html>
<body>
<h1>hola</h1>
<p>DB address: mocked-server-address-for-test:3306</p>
</body>
</html>`

	maxRetries := 3
	timeBetweenRetries := 10 * time.Second

	http_helper.HttpGetWithRetry(t, url, nil, expectedStatus, expectedBody, maxRetries, timeBetweenRetries)
}
