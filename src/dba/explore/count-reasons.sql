SELECT
    non_payment
    + breach
    + nuisance
    + illegal_use
    + failure_to_sign_renewal
    + access_denial
    + unapproved_subtenant
    + owner_move_in
    + demolition
    + capital_improvement
    + substantial_rehab
    + ellis_act_withdrawal
    + condo_conversion
    + roommate_same_unit
    + other_cause
    + late_payments
    + lead_remediation
    + development
    + good_samaritan_ends
        AS reason_sum
        , COUNT(*) AS r_count
FROM notice
GROUP BY reason_sum
ORDER BY r_count DESC;
