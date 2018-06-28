DROP TABLE IF EXISTS "notice";
CREATE TABLE notice (
    "eviction_id" TEXT,
    "reason_count" INTEGER,
    "address" TEXT,
    "zipcode" TEXT,
    "file_date" TEXT,
    "constraints_date" TEXT,
    "supervisor_district" TEXT,
    "neighborhood" TEXT,
    "longitude" DECIMAL,
    "latitude" DECIMAL,
    "non_payment" INTEGER, -- boolean
    "breach" INTEGER, -- boolean
    "nuisance" INTEGER, -- boolean
    "illegal_use" INTEGER, -- boolean
    "failure_to_sign_renewal" INTEGER, -- boolean
    "access_denial" INTEGER, -- boolean
    "unapproved_subtenant" INTEGER, -- boolean
    "owner_move_in" INTEGER, -- boolean
    "demolition" INTEGER, -- boolean
    "capital_improvement" INTEGER, -- boolean
    "substantial_rehab" INTEGER, -- boolean
    "ellis_act_withdrawal" INTEGER, -- boolean
    "condo_conversion" INTEGER, -- boolean
    "roommate_same_unit" INTEGER, -- boolean
    "other_cause" INTEGER, -- boolean
    "late_payments" INTEGER, -- boolean
    "lead_remediation" INTEGER, -- boolean
    "development" INTEGER, -- boolean
    "good_samaritan_ends" INTEGER, -- boolean
);
