DROP TABLE IF EXISTS "notice";
CREATE TABLE notice (
    "Eviction ID" TEXT NOT NULL,
    "Address" TEXT NOT NULL,
    "City" TEXT NOT NULL,
    "State" TEXT NOT NULL,
    "Eviction Notice Source Zipcode" TEXT,
    "File Date" TEXT NOT NULL,
    "Non Payment" INTEGER, -- boolean
    "Breach" INTEGER, -- boolean
    "Nuisance" INTEGER, -- boolean
    "Illegal Use" INTEGER, -- boolean
    "Failure to Sign Renewal" INTEGER, -- boolean
    "Access Denial" INTEGER, -- boolean
    "Unapproved Subtenant" INTEGER, -- boolean
    "Owner Move In" INTEGER, -- boolean
    "Demolition" INTEGER, -- boolean
    "Capital Improvement" INTEGER, -- boolean
    "Substantial Rehab" INTEGER, -- boolean
    "Ellis Act WithDrawal" INTEGER, -- boolean
    "Condo Conversion" INTEGER, -- boolean
    "Roommate Same Unit" INTEGER, -- boolean
    "Other Cause" INTEGER, -- boolean
    "Late Payments" INTEGER, -- boolean
    "Lead Remediation" INTEGER, -- boolean
    "Development" INTEGER, -- boolean
    "Good Samaritan Ends" INTEGER, -- boolean
    "Constraints Date" TEXT,
    "Supervisor District" TEXT,
    "Neighborhoods - Analysis Boundaries" TEXT,
    "Location" TEXT
);
