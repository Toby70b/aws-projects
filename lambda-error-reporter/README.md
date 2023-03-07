# lambda-error-reporter
Small project designed to inform a user should an error occur in one of their Lambdas.


## Current limitations
As the Lambda which is formatting the error before publishing to SNS is currently triggered by Cloudwatch logs, it is restricted to Cloudwatch logs within the same region as the Lambda. 
