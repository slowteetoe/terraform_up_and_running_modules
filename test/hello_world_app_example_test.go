package test

import (
	"fmt"
	"testing"
	"time"

	http_helper "github.com/gruntwork-io/terratest/modules/http-helper"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestHelloWorldAppExample(t *testing.T) {
	opts := &terraform.Options{
		TerraformDir: "../examples/hello-world-app",
		Vars: map[string]interface{}{
			"mysql_config": map[string]interface{}{
				"address": "mocked,-server-address-for-test",
				"port":    3306,
			},
		},
	}
	defer terraform.Destroy(t, opts)
	terraform.InitAndApply(t, opts)

	albDNSName := terraform.OutputRequired(t, opts, "alb_dns_name")
	url := fmt.Sprintf("http://%s", albDNSName)

	expectedStatus := 200
	expectedBody := "hola"

	maxRetries := 10
	timeBetweenRetries := 10 * time.Second

	http_helper.HttpGetWithRetry(t, url, nil, expectedStatus, expectedBody, maxRetries, timeBetweenRetries)
}
