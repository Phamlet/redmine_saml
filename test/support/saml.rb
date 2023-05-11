# frozen_string_literal: true

require Rails.root.join('plugins/redmine_saml/lib/redmine_saml')
require Rails.root.join('plugins/redmine_saml/lib/redmine_saml/base')

RedmineSaml::Base.configure do |config|
  config.saml = {
    assertion_consumer_service_url: "http://localhost#{RedmineSaml::CALLBACK_PATH}",
    idp_cert_fingerprint: '21:4D:FE:12:3A:83:69:A7:12:66:A4:B0:5D:E6:64:96:EF:26:07:2A',
    idp_slo_service_url: 'https://adfs.myserver.com/adfs/ls/?wa=wsignout1.0',
    idp_sso_service_url: 'https://adfs.myserver.com/adfs/ls',
    sp_entity_id: "http://localhost#{RedmineSaml::METADATA_PATH}",
    name_identifier_format: 'urn:oasis:names:tc:SAML:2.0:nameid-format:persistent',
    name_identifier_value: 'mail',
    single_logout_service_url: "http://localhost#{RedmineSaml::LOGOUT_SERVICE_PATH}",
    attribute_mapping_sep: '|',
    attribute_mapping: {
      username: 'extra|raw_info|NameID',
      login: 'extra|raw_info|username',
      mail: 'extra|raw_info|emailaddress',
      firstname: 'extra|raw_info|givenname',
      lastname: 'extra|raw_info|surname',
      email: 'extra|raw_info|emailaddress'
    }
  }
end
