INSERT INTO
    wrangled.notice
SELECT
    eviction_id

    -- convert file_date from MM/DD/YYYY to YYYY-MM-DD
     , CASE WHEN LENGTH(file_date) <> 10
        THEN file_date
        ELSE SUBSTR(file_date, -4)
                  || '-' || SUBSTR(file_date, 1, 2)
                  || '-' || SUBSTR(file_date, 4, 2)
        END AS
        _fdate

    -- count the number of TRUE values in the boolean "reason" columns
    , ( non_payment
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
        ) AS number_of_reasons

    -- extract binary value, e.g. '0100000000000000000',
    -- by concatenating all the boolean "reason" columns
    , ( non_payment
        || breach
        || nuisance
        || illegal_use
        || failure_to_sign_renewal
        || access_denial
        || unapproved_subtenant
        || owner_move_in
        || demolition
        || capital_improvement
        || substantial_rehab
        || ellis_act_withdrawal
        || condo_conversion
        || roommate_same_unit
        || other_cause
        || late_payments
        || lead_remediation
        || development
        || good_samaritan_ends
        ) AS reason_code
    , address
    , zipcode
    -- convert constraints_date from MM/DD/YYYY to YYYY-MM-DD
    , CASE WHEN LENGTH(constraints_date) <> 10
        THEN constraints_date
        ELSE SUBSTR(constraints_date, -4)
                  || '-' || SUBSTR(constraints_date, 1, 2)
                  || '-' || SUBSTR(constraints_date, 4, 2)
        END AS
      _cdate
    , supervisor_district
    , neighborhood
    -- extract '37.yyyyy' from: '(37.yyyyyyyyy, -122.xxxxxxxxxx)'
    , SUBSTR(coordinates, 2, 8)
        AS latitude
    -- extract '-122.xxxxx' from: '(37.yyyyyyyyy, -122.xxxxxxxxxx)'
    , SUBSTR(coordinates, INSTR(coordinates, ', ')+2, 10)
        AS longitude
    , non_payment
    , breach
    , nuisance
    , illegal_use
    , failure_to_sign_renewal
    , access_denial
    , unapproved_subtenant
    , owner_move_in
    , demolition
    , capital_improvement
    , substantial_rehab
    , ellis_act_withdrawal
    , condo_conversion
    , roommate_same_unit
    , other_cause
    , late_payments
    , lead_remediation
    , development
    , good_samaritan_ends
FROM
    vanilla.notice
ORDER BY
    _fdate
    , vanilla.notice.eviction_id ASC;
