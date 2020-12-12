// Generate basic transaction details for logging
fun baseLogDetails(vars) = {
	txnID: vars.txnID
}

// Additional logging fields
fun log(vars) = baseLogDetails(vars)
fun log(vars, extraFields: Object) = baseLogDetails(vars) ++ extraFields
