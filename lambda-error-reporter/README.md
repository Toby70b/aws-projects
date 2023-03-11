# lambda-error-reporter
The Lambda Error Reporter is a small tool which monitors cloudwatch logs and inform users should an error occur in one of their applications logging 
to cloudwatch.


## Current limitations
As the Lambda which is formatting the error before publishing to SNS is currently triggered by Cloudwatch logs, it is restricted to Cloudwatch logs within the same region as the Lambda. 
