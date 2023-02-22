function Fix-ElementValues {
    param (
        $value
    )
    # TRIM GARBAGE CHARACTERS
    $return = $value.Trim()

    # BOOL
    if ($return -eq "false") {
        Write-Verbose "Typecasting $value as bool"
        [bool]$return = $False
    }
    elseif ($return -eq "true") {
        Write-Verbose "Typecasting $value as bool"
        [bool]$return = $True
    }

    # INTEGER
    if ($return -match '^\d+$') {
        Write-Verbose "Typecasting $value as int"
        [int]$return = $return
    }

    # RETURN CHANGE CHECK
    if ($return -eq $value) {
        Write-Verbose "No changes made for $value"
    }
    else {
        Write-Verbose "Changed `"$value`" to `"$return`""
    }

    $return.GetType()
    return $return
}
