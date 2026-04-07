-- CoachOS Database Schema
CREATE TABLE locations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL, slug TEXT UNIQUE NOT NULL, address TEXT
);
CREATE TABLE coaches (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  first_name TEXT NOT NULL, email TEXT UNIQUE NOT NULL, level TEXT NOT NULL,
  location_id UUID REFERENCES locations(id)
);
CREATE TABLE members (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  first_name TEXT NOT NULL, email TEXT UNIQUE NOT NULL,
  location_id UUID REFERENCES locations(id),
  assigned_coach_id UUID REFERENCES coaches(id),
  last_session_date TIMESTAMPTZ
);
INSERT INTO locations (name, slug, address) VALUES
  ('Elements4Life Belconnen','belconnen','Belconnen ACT 2617'),
  ('Elements4Life Harrison','harrison','170 Flemington Road, Harrison ACT 2914'),
  ('Elements4Life Murrumbateman','murrumbateman','Murrumbateman NSW 2582');