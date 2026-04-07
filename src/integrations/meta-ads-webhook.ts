// Meta Lead Ads ingestion - LeadFlow
type GymLocation = 'belconnen' | 'harrison' | 'murrumbateman';
function extractField(fields: any[], name: string): string {
  return fields.find(f => f.name === name)?.values[0] ?? '';
}
export function parseMetaLeadPayload(raw: any) {
  const change = raw.entry[0]?.changes[0];
  if (!change) return null;
  const fields = change.value.field_data;
  return {
    source: 'meta_ads' as const,
    email: extractField(fields, 'email'),
    phone: extractField(fields, 'phone_number'),
    gymLocation: extractField(fields, 'gym_location').toLowerCase() as GymLocation || 'harrison',
    serviceInterest: extractField(fields, 'service_interest'),
    createdAt: new Date(change.value.created_time * 1000),
  };
}