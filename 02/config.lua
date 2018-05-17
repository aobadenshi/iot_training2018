-------------------------------------------------------------------------------
-- Logging
-------------------------------------------------------------------------------

scripts.log_level = "INFO"
scripts.log_audit_target = "file://<EMS_HOME>/log/audit.log"
scripts.log_publish_directory = "<EMS_HOME>/log/"
scripts.log_publish_level = "INFO"
scripts.log_max_file_storage = 2000000
scripts.log_auto_flush = true
scripts.log_flush_chunk_size = 16384
scripts.log_buffer_size = 4096

--
-- FIPS Mode
--
scripts.fips_enabled = false

--
-- Connection parameters
--
scripts.rap_host = "localhost"
scripts.rap_port = 8000
scripts.rap_ssl = true
scripts.rap_server_authenticate = false
scripts.rap_deny_selfsigned = false
scripts.rap_validate = false

--
-- HTTP Server Configuration
--
scripts.script_resource_host = "localhost"
scripts.script_resource_port = 8001
scripts.script_resource_ssl = true
scripts.script_resource_authenticate = false
scripts.script_resource_use_default_certificate = true

-------------------------------------------------------------------------------
-- Edge Thing Configuration
-------------------------------------------------------------------------------

scripts.EdgeThing_sfujiwara = {
   file = "thing.lua",
   template = "edgething",
}

-------------------------------------------------------------------------------
-- Integration script
-------------------------------------------------------------------------------

scripts.bme280 = {
  file = "bme280.lua"
}
