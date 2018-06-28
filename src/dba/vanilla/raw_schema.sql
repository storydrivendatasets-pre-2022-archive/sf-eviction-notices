DROP TABLE IF EXISTS "notice";
CREATE TABLE notice (
    "Eviction ID" TEXT NOT NULL,
    "Address" TEXT NOT NULL,
    "City" TEXT NOT NULL,
    "State" TEXT NOT NULL,
    "Eviction Notice Source Zipcode" TEXT,
    "File Date" TEXT NOT NULL,
    "Non Payment" TEXT, -- boolean
    "Breach" TEXT, -- boolean
    "Nuisance" TEXT, -- boolean
    "Illegal Use" TEXT, -- boolean
    "Failure to Sign Renewal" TEXT, -- boolean
    "Access Denial" TEXT, -- boolean
    "Unapproved Subtenant" TEXT, -- boolean
    "Owner Move In" TEXT, -- boolean
    "Demolition" TEXT, -- boolean
    "Capital Improvement" TEXT, -- boolean
    "Substantial Rehab" TEXT, -- boolean
    "Ellis Act WithDrawal" TEXT, -- boolean
    "Condo Conversion" TEXT, -- boolean
    "Roommate Same Unit" TEXT, -- boolean
    "Other Cause" TEXT, -- boolean
    "Late Payments" TEXT, -- boolean
    "Lead Remediation" TEXT, -- boolean
    "Development" TEXT, -- boolean
    "Good Samaritan Ends" TEXT, -- boolean
    "Constraints Date" TEXT,
    "Supervisor District" TEXT,
    "Neighborhoods - Analysis Boundaries" TEXT,
    "Location" TEXT
);
