// Generate basic transaction details for logging
fun baseLogDetails(vars) = {
	txnID: vars.txnID
}

// Function to add additional fields to the log
fun log(vars) = baseLogDetails(vars)
fun log(vars, extraFields: Object) = baseLogDetails(vars) ++ extraFields
