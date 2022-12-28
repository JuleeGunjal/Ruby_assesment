# frozen_string_literal: true

# Defining all constants used in project

# Regex for email validation
EMAIL_REGEX = /\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})/

# Mobile number start with country code followed by number
# MOBILE_NO_REGEX = (\+?\d{1,4}[\s-])?(?!0+\s+,?$)\d{10}\s*,?/
# MOBILE_NO_REGEX = /[0-9]{10}/

# Regex for password validation (At least one capital, one small and one special charater  )
PASSWORD_REGEX = /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]/

SECRET_KEY = '529ea0fe26e27542661a737738b4d9918f2faf7eb8011ba65f1bc2f5dff899b51da3cee46ec911aae63fbae294191e6f5a6b870dba95d7952035e0244233d8df'

ALGO = 'HS256'
