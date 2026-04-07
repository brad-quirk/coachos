// Fix: null-safe field mapping - closes #4
export function parseCalendlyPayload(raw: any) {
  const { payload } = raw;
  return {
    memberName: payload.invitee.name,
    memberEmail: payload.invitee.email,
    memberPhone: payload.invitee.phone_number ?? '', // null-safe fix
    startTime: new Date(payload.scheduled_event.start_time),
  };
}