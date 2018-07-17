# @since 2.0.0
type SSSD::Certificate::Verification = Variant[Enum['no_ocsp', 'no_verification'], Tuple[Enum['ocsp_default_responder', 'ocsp_default_responder_signing_cert'], String]]
