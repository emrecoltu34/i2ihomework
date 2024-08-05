# Function to calculate factorial
function Get-Factorial {
    param (
        [int]$num
    )
    if ($num -le 1) {
        return 1
    } else {
        return $num * (Get-Factorial ($num - 1))
    }
}

# Prompt user for the operation
Write-Host "Select the operation:"
Write-Host "+ (addition)"
Write-Host "- (subtraction)"
Write-Host "* (multiplication)"
Write-Host "/ (division)"
Write-Host "% (modulo)"
Write-Host "! (factorial)"
$operation = Read-Host "Enter the operation"

# Prompt user for input numbers based on the operation
if ($operation -eq "!") {
    $num1 = Read-Host "Enter a number"
} else {
    $num1 = Read-Host "Enter the first number"
    $num2 = Read-Host "Enter the second number"
}

# Perform the calculation
switch ($operation) {
    "+" {
        $result = [math]::Round([decimal]::Parse($num1) + [decimal]::Parse($num2), 2)
    }
    "-" {
        $result = [math]::Round([decimal]::Parse($num1) - [decimal]::Parse($num2), 2)
    }
    "*" {
        $result = [math]::Round([decimal]::Parse($num1) * [decimal]::Parse($num2), 2)
    }
    "/" {
        $result = [math]::Round([decimal]::Parse($num1) / [decimal]::Parse($num2), 2)
    }
    "%" {
        $result = [decimal]::Parse($num1) % [decimal]::Parse($num2)
    }
    "!" {
        $result = Get-Factorial -num [int]::Parse($num1)
    }
    default {
        Write-Host "Invalid operation"
        exit
    }
}

# Print the result
Write-Host "The result is: $result"