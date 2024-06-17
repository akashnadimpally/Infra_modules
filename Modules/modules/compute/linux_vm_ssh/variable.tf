variable "vm_count" {
  type = number
}

variable "linux_vm_name" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "location_name" {
  type = string
}

variable "size_name" {
  type = string
}

variable "vm_priority" {
  type = string
  default = "Regular"
  validation {
    condition = contains(["Regular", "Spot"], var.vm_priority)
    error_message = "Must be either Regular or Spot"
  }
}

variable "vm_eviction_policy" {
  type = string
  default = "Delete"
  validation {
    condition = contains(["Delete", "Deallocate"], var.vm_eviction_policy)
    error_message = "Must be Delete or Deallocate"
  }
}

variable "admin_pass" {
  type      = string
  sensitive = true
  default = null
}

variable "disable_password_authentication" {
  type = bool
  default = false
}

variable "admin_user" {
  type = string
}

variable "vm_public_key" {
  type = string
  default = ""
  # validation {
  #   condition = var.disable_password_authentication == true
  #   error_message = "Not needed when password is used"
  # }
}

variable "nic_id" {
  type = list(string)
}

variable "linux_flavour_version" {
  type = string
}

variable "cache_os_disk" {
  type = string
}

variable "storage_acc_type_os_disk" {
  type = string
}

variable "linux_flavour_name" {
  type = string
}

variable "linux_vm_extension_name" {
  type    = string
  default = null
}

variable "linux_flavour_publisher" {
  type = string
}

variable "identity_type" {
  type = string
}

variable "uami_ids" {
  type = string
}

variable "linux_custom_data" {
  type    = string
  default = null
}


  # Standard_B1ls,Standard_B1ms,Standard_B1s,Standard_B2ms,Standard_B2s,Standard_B4ms,Standard_B8ms,Standard_B12ms,Standard_B16ms,Standard_B20ms,Standard_D1_v2,Standard_D2_v2,Standard_D3_v2,Standard_D4_v2,Standard_D5_v2,Standard_D11_v2,Standard_D12_v2,Standard_D13_v2,Standard_D14_v2,Standard_D15_v2,Standard_D2_v2_Promo,Standard_D3_v2_Promo,Standard_D4_v2_Promo,Standard_D5_v2_Promo,Standard_D11_v2_Promo,Standard_D12_v2_Promo,Standard_D13_v2_Promo,Standard_D14_v2_Promo,Standard_DS2_v2_Promo,Standard_DS3_v2_Promo,Standard_DS4_v2_Promo,Standard_DS5_v2_Promo,Standard_DS11_v2_Promo,Standard_DS12_v2_Promo,Standard_DS13_v2_Promo,Standard_DS14_v2_Promo,Standard_F1,Standard_F2,Standard_F4,Standard_F8,Standard_F16,Standard_A1_v2,Standard_A2m_v2,Standard_A2_v2,Standard_A4m_v2,Standard_A4_v2,Standard_A8m_v2,Standard_A8_v2,Standard_D2_v3,Standard_D4_v3,Standard_D8_v3,Standard_D16_v3,Standard_D32_v3,Standard_D48_v3,Standard_D64_v3,Standard_E2_v3,Standard_E4_v3,Standard_E8_v3,Standard_E16_v3,Standard_E20_v3,Standard_E32_v3,Standard_E48_v3,Standard_E64_v3,Standard_D1,Standard_D2,Standard_D3,Standard_D4,Standard_D11,Standard_D12,Standard_D13,Standard_D14,Standard_DS1_v2,Standard_DS2_v2,Standard_DS3_v2,Standard_DS4_v2,Standard_DS5_v2,Standard_DS11-1_v2,Standard_DS11_v2,Standard_DS12-1_v2,Standard_DS12-2_v2,Standard_DS12_v2,Standard_DS13-2_v2,Standard_DS13-4_v2,Standard_DS13_v2,Standard_DS14-4_v2,Standard_DS14-8_v2,Standard_DS14_v2,Standard_DS15_v2,Standard_F1s,Standard_F2s,Standard_F4s,Standard_F8s,Standard_F16s,Standard_D2s_v3,Standard_D4s_v3,Standard_D8s_v3,Standard_D16s_v3,Standard_D32s_v3,Standard_D48s_v3,Standard_D64s_v3,Standard_E2s_v3,Standard_E4-2s_v3,Standard_E4s_v3,Standard_E8-2s_v3,Standard_E8-4s_v3,Standard_E8s_v3,Standard_E16-4s_v3,Standard_E16-8s_v3,Standard_E16s_v3,Standard_E20s_v3,Standard_E32-8s_v3,Standard_E32-16s_v3,Standard_E32s_v3,Standard_E48s_v3,Standard_E64-16s_v3,Standard_E64-32s_v3,Standard_E64s_v3,Standard_DS1,Standard_DS2,Standard_DS3,Standard_DS4,Standard_DS11,Standard_DS12,Standard_DS13,Standard_DS14,Standard_E2_v4,Standard_E4_v4,Standard_E8_v4,Standard_E16_v4,Standard_E20_v4,Standard_E32_v4,Standard_E48_v4,Standard_E64_v4,Standard_E2d_v4,Standard_E4d_v4,Standard_E8d_v4,Standard_E16d_v4,Standard_E20d_v4,Standard_E32d_v4,Standard_E48d_v4,Standard_E64d_v4,Standard_E2s_v4,Standard_E4-2s_v4,Standard_E4s_v4,Standard_E8-2s_v4,Standard_E8-4s_v4,Standard_E8s_v4,Standard_E16-4s_v4,Standard_E16-8s_v4,Standard_E16s_v4,Standard_E20s_v4,Standard_E32-8s_v4,Standard_E32-16s_v4,Standard_E32s_v4,Standard_E48s_v4,Standard_E64-16s_v4,Standard_E64-32s_v4,Standard_E64s_v4,Standard_E80is_v4,Standard_E2ds_v4,Standard_E4-2ds_v4,Standard_E4ds_v4,Standard_E8-2ds_v4,Standard_E8-4ds_v4,Standard_E8ds_v4,Standard_E16-4ds_v4,Standard_E16-8ds_v4,Standard_E16ds_v4,Standard_E20ds_v4,Standard_E32-8ds_v4,Standard_E32-16ds_v4,Standard_E32ds_v4,Standard_E48ds_v4,Standard_E64-16ds_v4,Standard_E64-32ds_v4,Standard_E64ds_v4,Standard_E80ids_v4,Standard_D2d_v4,Standard_D4d_v4,Standard_D8d_v4,Standard_D16d_v4,Standard_D32d_v4,Standard_D48d_v4,Standard_D64d_v4,Standard_D2_v4,Standard_D4_v4,Standard_D8_v4,Standard_D16_v4,Standard_D32_v4,Standard_D48_v4,Standard_D64_v4,Standard_D2ds_v4,Standard_D4ds_v4,Standard_D8ds_v4,Standard_D16ds_v4,Standard_D32ds_v4,Standard_D48ds_v4,Standard_D64ds_v4,Standard_D2s_v4,Standard_D4s_v4,Standard_D8s_v4,Standard_D16s_v4,Standard_D32s_v4,Standard_D48s_v4,Standard_D64s_v4,Standard_F2s_v2,Standard_F4s_v2,Standard_F8s_v2,Standard_F16s_v2,Standard_F32s_v2,Standard_F48s_v2,Standard_F64s_v2,Standard_F72s_v2,Standard_D2a_v4,Standard_D4a_v4,Standard_D8a_v4,Standard_D16a_v4,Standard_D32a_v4,Standard_D48a_v4,Standard_D64a_v4,Standard_D96a_v4,Standard_D2as_v4,Standard_D4as_v4,Standard_D8as_v4,Standard_D16as_v4,Standard_D32as_v4,Standard_D48as_v4,Standard_D64as_v4,Standard_D96as_v4,Standard_E2a_v4,Standard_E4a_v4,Standard_E8a_v4,Standard_E16a_v4,Standard_E20a_v4,Standard_E32a_v4,Standard_E48a_v4,Standard_E64a_v4,Standard_E96a_v4,Standard_E2as_v4,Standard_E4-2as_v4,Standard_E4as_v4,Standard_E8-2as_v4,Standard_E8-4as_v4,Standard_E8as_v4,Standard_E16-4as_v4,Standard_E16-8as_v4,Standard_E16as_v4,Standard_E20as_v4,Standard_E32-8as_v4,Standard_E32-16as_v4,Standard_E32as_v4,Standard_E48as_v4,Standard_E64-16as_v4,Standard_E64-32as_v4,Standard_E64as_v4,Standard_E96-24as_v4,Standard_E96-48as_v4,Standard_E96as_v4,Standard_D2as_v5,Standard_D4as_v5,Standard_D8as_v5,Standard_D16as_v5,Standard_D32as_v5,Standard_D48as_v5,Standard_D64as_v5,Standard_D96as_v5,Standard_E2as_v5,Standard_E4-2as_v5,Standard_E4as_v5,Standard_E8-2as_v5,Standard_E8-4as_v5,Standard_E8as_v5,Standard_E16-4as_v5,Standard_E16-8as_v5,Standard_E16as_v5,Standard_E20as_v5,Standard_E32-8as_v5,Standard_E32-16as_v5,Standard_E32as_v5,Standard_E48as_v5,Standard_E64-16as_v5,Standard_E64-32as_v5,Standard_E64as_v5,Standard_E96-24as_v5,Standard_E96-48as_v5,Standard_E96as_v5,Standard_E112ias_v5,Standard_D2ads_v5,Standard_D4ads_v5,Standard_D8ads_v5,Standard_D16ads_v5,Standard_D32ads_v5,Standard_D48ads_v5,Standard_D64ads_v5,Standard_D96ads_v5,Standard_E2ads_v5,Standard_E4-2ads_v5,Standard_E4ads_v5,Standard_E8-2ads_v5,Standard_E8-4ads_v5,Standard_E8ads_v5,Standard_E16-4ads_v5,Standard_E16-8ads_v5,Standard_E16ads_v5,Standard_E20ads_v5,Standard_E32-8ads_v5,Standard_E32-16ads_v5,Standard_E32ads_v5,Standard_E48ads_v5,Standard_E64-16ads_v5,Standard_E64-32ads_v5,Standard_E64ads_v5,Standard_E96-24ads_v5,Standard_E96-48ads_v5,Standard_E96ads_v5,Standard_E112iads_v5,Standard_B2als_v2,Standard_B2as_v2,Standard_B2ats_v2,Standard_B4als_v2,Standard_B4as_v2,Standard_B8als_v2,Standard_B8as_v2,Standard_B16als_v2,Standard_B16as_v2,Standard_B32als_v2,Standard_B32as_v2,Standard_M64,Standard_M64m,Standard_M128,Standard_M128m,Standard_M8-2ms,Standard_M8-4ms,Standard_M8ms,Standard_M16-4ms,Standard_M16-8ms,Standard_M16ms,Standard_M32-8ms,Standard_M32-16ms,Standard_M32ls,Standard_M32ms,Standard_M32ts,Standard_M64-16ms,Standard_M64-32ms,Standard_M64ls,Standard_M64ms,Standard_M64s,Standard_M128-32ms,Standard_M128-64ms,Standard_M128ms,Standard_M128s,Standard_M32ms_v2,Standard_M64ms_v2,Standard_M64s_v2,Standard_M128ms_v2,Standard_M128s_v2,Standard_M192ims_v2,Standard_M192is_v2,Standard_M32dms_v2,Standard_M64dms_v2,Standard_M64ds_v2,Standard_M128dms_v2,Standard_M128ds_v2,Standard_M192idms_v2,Standard_M192ids_v2,Standard_DC2as_v5,Standard_DC4as_v5,Standard_DC8as_v5,Standard_DC16as_v5,Standard_DC32as_v5,Standard_DC48as_v5,Standard_DC64as_v5,Standard_DC96as_v5,Standard_DC2ads_v5,Standard_DC4ads_v5,Standard_DC8ads_v5,Standard_DC16ads_v5,Standard_DC32ads_v5,Standard_DC48ads_v5,Standard_DC64ads_v5,Standard_DC96ads_v5,Standard_EC2as_v5,Standard_EC4as_v5,Standard_EC8as_v5,Standard_EC16as_v5,Standard_EC20as_v5,Standard_EC32as_v5,Standard_EC48as_v5,Standard_EC64as_v5,Standard_EC96as_v5,Standard_EC96ias_v5,Standard_EC2ads_v5,Standard_EC4ads_v5,Standard_EC8ads_v5,Standard_EC16ads_v5,Standard_EC20ads_v5,Standard_EC32ads_v5,Standard_EC48ads_v5,Standard_EC64ads_v5,Standard_EC96ads_v5,Standard_EC96iads_v5,Standard_DC4as_cc_v5,Standard_DC8as_cc_v5,Standard_DC16as_cc_v5,Standard_DC32as_cc_v5,Standard_DC48as_cc_v5,Standard_DC64as_cc_v5,Standard_DC96as_cc_v5,Standard_DC4ads_cc_v5,Standard_DC8ads_cc_v5,Standard_DC16ads_cc_v5,Standard_DC32ads_cc_v5,Standard_DC48ads_cc_v5,Standard_DC64ads_cc_v5,Standard_DC96ads_cc_v5,Standard_EC4as_cc_v5,Standard_EC8as_cc_v5,Standard_EC16as_cc_v5,Standard_EC20as_cc_v5,Standard_EC32as_cc_v5,Standard_EC48as_cc_v5,Standard_EC64as_cc_v5,Standard_EC96as_cc_v5,Standard_EC4ads_cc_v5,Standard_EC8ads_cc_v5,Standard_EC16ads_cc_v5,Standard_EC20ads_cc_v5,Standard_EC32ads_cc_v5,Standard_EC48ads_cc_v5,Standard_EC64ads_cc_v5,Standard_EC96ads_cc_v5,Standard_E96ias_v4,Standard_A0,Standard_A1,Standard_A2,Standard_A3,Standard_A5,Standard_A4,Standard_A6,Standard_A7,Basic_A0,Basic_A1,Basic_A2,Basic_A3,Basic_A4,Standard_M12ds_v3,Standard_M12s_v3,Standard_M24ds_v3,Standard_M24s_v3,Standard_M48ds_1_v3,Standard_M48s_1_v3,Standard_M96ds_1_v3,Standard_M96ds_2_v3,Standard_M96s_1_v3,Standard_M96s_2_v3,Standard_M176ds_3_v3,Standard_M176ds_4_v3,Standard_M176s_3_v3,Standard_M176s_4_v3,Standard_D2ds_v5,Standard_D4ds_v5,Standard_D8ds_v5,Standard_D16ds_v5,Standard_D32ds_v5,Standard_D48ds_v5,Standard_D64ds_v5,Standard_D96ds_v5,Standard_D2d_v5,Standard_D4d_v5,Standard_D8d_v5,Standard_D16d_v5,Standard_D32d_v5,Standard_D48d_v5,Standard_D64d_v5,Standard_D96d_v5,Standard_D2s_v5,Standard_D4s_v5,Standard_D8s_v5,Standard_D16s_v5,Standard_D32s_v5,Standard_D48s_v5,Standard_D64s_v5,Standard_D96s_v5,Standard_D2_v5,Standard_D4_v5,Standard_D8_v5,Standard_D16_v5,Standard_D32_v5,Standard_D48_v5,Standard_D64_v5,Standard_D96_v5,Standard_E2ds_v5,Standard_E4-2ds_v5,Standard_E4ds_v5,Standard_E8-2ds_v5,Standard_E8-4ds_v5,Standard_E8ds_v5,Standard_E16-4ds_v5,Standard_E16-8ds_v5,Standard_E16ds_v5,Standard_E20ds_v5,Standard_E32-8ds_v5,Standard_E32-16ds_v5,Standard_E32ds_v5,Standard_E48ds_v5,Standard_E64-16ds_v5,Standard_E64-32ds_v5,Standard_E64ds_v5,Standard_E96-24ds_v5,Standard_E96-48ds_v5,Standard_E96ds_v5,Standard_E104ids_v5,Standard_E2d_v5,Standard_E4d_v5,Standard_E8d_v5,Standard_E16d_v5,Standard_E20d_v5,Standard_E32d_v5,Standard_E48d_v5,Standard_E64d_v5,Standard_E96d_v5,Standard_E104id_v5,Standard_E2s_v5,Standard_E4-2s_v5,Standard_E4s_v5,Standard_E8-2s_v5,Standard_E8-4s_v5,Standard_E8s_v5,Standard_E16-4s_v5,Standard_E16-8s_v5,Standard_E16s_v5,Standard_E20s_v5,Standard_E32-8s_v5,Standard_E32-16s_v5,Standard_E32s_v5,Standard_E48s_v5,Standard_E64-16s_v5,Standard_E64-32s_v5,Standard_E64s_v5,Standard_E96-24s_v5,Standard_E96-48s_v5,Standard_E96s_v5,Standard_E104is_v5,Standard_E2_v5,Standard_E4_v5,Standard_E8_v5,Standard_E16_v5,Standard_E20_v5,Standard_E32_v5,Standard_E48_v5,Standard_E64_v5,Standard_E96_v5,Standard_E104i_v5,Standard_E2bs_v5,Standard_E4bs_v5,Standard_E8bs_v5,Standard_E16bs_v5,Standard_E32bs_v5,Standard_E48bs_v5,Standard_E64bs_v5,Standard_E96bs_v5,Standard_E112ibs_v5,Standard_E2bds_v5,Standard_E4bds_v5,Standard_E8bds_v5,Standard_E16bds_v5,Standard_E32bds_v5,Standard_E48bds_v5,Standard_E64bds_v5,Standard_E96bds_v5,Standard_E112ibds_v5,Standard_D2ls_v5,Standard_D4ls_v5,Standard_D8ls_v5,Standard_D16ls_v5,Standard_D32ls_v5,Standard_D48ls_v5,Standard_D64ls_v5,Standard_D96ls_v5,Standard_D2lds_v5,Standard_D4lds_v5,Standard_D8lds_v5,Standard_D16lds_v5,Standard_D32lds_v5,Standard_D48lds_v5,Standard_D64lds_v5,Standard_D96lds_v5,Standard_B2ls_v2,Standard_B2s_v2,Standard_B2ts_v2,Standard_B4ls_v2,Standard_B4s_v2,Standard_B8ls_v2,Standard_B8s_v2,Standard_B16ls_v2,Standard_B16s_v2,Standard_B32ls_v2,Standard_B32s_v2,Standard_E64i_v3,Standard_E64is_v3,Standard_M208ms_v2,Standard_M208s_v2,Standard_M416-208s_v2,Standard_M416s_v2,Standard_M416-208ms_v2,Standard_M416ms_v2,Standard_M416s_8_v2,Standard_L8s_v3,Standard_L16s_v3,Standard_L32s_v3,Standard_L48s_v3,Standard_L64s_v3,Standard_L80s_v3,Standard_L8as_v3,Standard_L16as_v3,Standard_L32as_v3,Standard_L48as_v3,Standard_L64as_v3,Standard_L80as_v3,Standard_NC4as_T4_v3,Standard_NC8as_T4_v3,Standard_NC16as_T4_v3,Standard_NC64as_T4_v3,Standard_NV6s_v2,Standard_NV12s_v2,Standard_NV24s_v2,Standard_NV12s_v3,Standard_NV24s_v3,Standard_NV48s_v3,Standard_HB120-16rs_v2,Standard_HB120-32rs_v2,Standard_HB120-64rs_v2,Standard_HB120-96rs_v2,Standard_HB120rs_v2,Standard_D2plds_v5,Standard_D4plds_v5,Standard_D8plds_v5,Standard_D16plds_v5,Standard_D32plds_v5,Standard_D48plds_v5,Standard_D64plds_v5,Standard_D2pls_v5,Standard_D4pls_v5,Standard_D8pls_v5,Standard_D16pls_v5,Standard_D32pls_v5,Standard_D48pls_v5,Standard_D64pls_v5,Standard_D2pds_v5,Standard_D4pds_v5,Standard_D8pds_v5,Standard_D16pds_v5,Standard_D32pds_v5,Standard_D48pds_v5,Standard_D64pds_v5,Standard_D2ps_v5,Standard_D4ps_v5,Standard_D8ps_v5,Standard_D16ps_v5,Standard_D32ps_v5,Standard_D48ps_v5,Standard_D64ps_v5,Standard_E2pds_v5,Standard_E4pds_v5,Standard_E8pds_v5,Standard_E16pds_v5,Standard_E20pds_v5,Standard_E32pds_v5,Standard_E2ps_v5,Standard_E4ps_v5,Standard_E8ps_v5,Standard_E16ps_v5,Standard_E20ps_v5,Standard_E32ps_v5,Standard_B2pls_v2,Standard_B2ps_v2,Standard_B2pts_v2,Standard_B4pls_v2,Standard_B4ps_v2,Standard_B8pls_v2,Standard_B8ps_v2,Standard_B16pls_v2,Standard_B16ps_v2,Standard_NC24ads_A100_v4,Standard_NC48ads_A100_v4,Standard_NC96ads_A100_v4,Standard_L8s_v2,Standard_L16s_v2,Standard_L32s_v2,Standard_L48s_v2,Standard_L64s_v2,Standard_L80s_v2,Standard_NV6ads_A10_v5,Standard_NV12ads_A10_v5,Standard_NV18ads_A10_v5,Standard_NV36adms_A10_v5,Standard_NV36ads_A10_v5,Standard_NV72ads_A10_v5,Standard_DC8_v2,Standard_DC1s_v2,Standard_DC2s_v2,Standard_DC4s_v2,Standard_ND40rs_v2,Standard_HC44-16rs,Standard_HC44-32rs,Standard_HC44rs,Standard_FX4mds,Standard_FX12mds,Standard_FX24mds,Standard_FX36mds,Standard_FX48mds,Standard_NP10s,Standard_NP20s,Standard_NP40s,Standard_NC6,Standard_NC12,Standard_NC24,Standard_NC24r,Standard_NC6_Promo,Standard_NC12_Promo,Standard_NC24_Promo,Standard_NC24r_Promo,Standard_NV6,Standard_NV12,Standard_NV24,Standard_NV6_Promo,Standard_NV12_Promo,Standard_NV24_Promo,Standard_HB120-16rs_v3,Standard_HB120-32rs_v3,Standard_HB120-64rs_v3,Standard_HB120-96rs_v3,Standard_HB120rs_v3,Standard_ND96amsr_A100_v4,Standard_NV4as_v4,Standard_NV8as_v4,Standard_NV16as_v4,Standard_NV32as_v4,Standard_DC1s_v3,Standard_DC2s_v3,Standard_DC4s_v3,Standard_DC8s_v3,Standard_DC16s_v3,Standard_DC24s_v3,Standard_DC32s_v3,Standard_DC48s_v3,Standard_DC1ds_v3,Standard_DC2ds_v3,Standard_DC4ds_v3,Standard_DC8ds_v3,Standard_DC16ds_v3,Standard_DC24ds_v3,Standard_DC32ds_v3,Standard_DC48ds_v3,Standard_NC6s_v3,Standard_NC12s_v3,Standard_NC24rs_v3,Standard_NC24s_v3,Standard_G1,Standard_G2,Standard_G3,Standard_G4,Standard_DC2s,Standard_DC4s,Standard_PB6s,Standard_HB60-15rs,Standard_HB60-30rs,Standard_HB60-45rs,Standard_HB60rs,Standard_ND96asr_v4,Standard_ND40s_v3,Standard_HX176-24rs,Standard_HX176-48rs,Standard_HX176-96rs,Standard_HX176-144rs,Standard_HX176rs,Standard_HB176-24rs_v4,Standard_HB176-48rs_v4,Standard_HB176-96rs_v4,Standard_HB176-144rs_v4,Standard_HB176rs_v4,Standard_ND6s,Standard_ND12s,Standard_ND24rs,Standard_ND24s,Standard_NC8ads_A10_v4,Standard_NC16ads_A10_v4,Standard_NC32ads_A10_v4,Standard_NC6s_v2,Standard_NC12s_v2,Standard_NC24rs_v2,Standard_NC24s_v2


# ubuntu1604 = {
#       publisher = "Canonical"
#       offer     = "UbuntuServer"
#       sku       = "16.04-LTS"
#       version   = "latest"
#     },

#     ubuntu1804 = {
#       publisher = "Canonical"
#       offer     = "UbuntuServer"
#       sku       = "18.04-LTS"
#       version   = "latest"
#     },

#     ubuntu1904 = {
#       publisher = "Canonical"
#       offer     = "UbuntuServer"
#       sku       = "19.04"
#       version   = "latest"
#     },

#     ubuntu2004 = {
#       publisher = "Canonical"
#       offer     = "0001-com-ubuntu-server-focal-daily"
#       sku       = "20_04-daily-lts"
#       version   = "latest"
#     },

#     ubuntu2004-gen2 = {
#       publisher = "Canonical"
#       offer     = "0001-com-ubuntu-server-focal-daily"
#       sku       = "20_04-daily-lts-gen2"
#       version   = "latest"
#     },

#     centos77 = {
#       publisher = "OpenLogic"
#       offer     = "CentOS"
#       sku       = "7.7"
#       version   = "latest"
#     },

#     centos78-gen2 = {
#       publisher = "OpenLogic"
#       offer     = "CentOS"
#       sku       = "7_8-gen2"
#       version   = "latest"
#     },

#     centos79-gen2 = {
#       publisher = "OpenLogic"
#       offer     = "CentOS"
#       sku       = "7_9-gen2"
#       version   = "latest"
#     },

#     centos81 = {
#       publisher = "OpenLogic"
#       offer     = "CentOS"
#       sku       = "8_1"
#       version   = "latest"
#     },

#     centos81-gen2 = {
#       publisher = "OpenLogic"
#       offer     = "CentOS"
#       sku       = "8_1-gen2"
#       version   = "latest"
#     },

#     centos82-gen2 = {
#       publisher = "OpenLogic"
#       offer     = "CentOS"
#       sku       = "8_2-gen2"
#       version   = "latest"
#     },

#     centos83-gen2 = {
#       publisher = "OpenLogic"
#       offer     = "CentOS"
#       sku       = "8_3-gen2"
#       version   = "latest"
#     },

#     centos84-gen2 = {
#       publisher = "OpenLogic"
#       offer     = "CentOS"
#       sku       = "8_4-gen2"
#       version   = "latest"
#     },

#     coreos = {
#       publisher = "CoreOS"
#       offer     = "CoreOS"
#       sku       = "Stable"
#       version   = "latest"
#     },

#     rhel78 = {
#       publisher = "RedHat"
#       offer     = "RHEL"
#       sku       = "7.8"
#       version   = "latest"
#     },

#     rhel78-gen2 = {
#       publisher = "RedHat"
#       offer     = "RHEL"
#       sku       = "78-gen2"
#       version   = "latest"
#     },

#     rhel79 = {
#       publisher = "RedHat"
#       offer     = "RHEL"
#       sku       = "7.9"
#       version   = "latest"
#     },

#     rhel79-gen2 = {
#       publisher = "RedHat"
#       offer     = "RHEL"
#       sku       = "79-gen2"
#       version   = "latest"
#     },

#     rhel81 = {
#       publisher = "RedHat"
#       offer     = "RHEL"
#       sku       = "8.1"
#       version   = "latest"
#     },

#     rhel81-gen2 = {
#       publisher = "RedHat"
#       offer     = "RHEL"
#       sku       = "81gen2"
#       version   = "latest"
#     },

#     rhel82 = {
#       publisher = "RedHat"
#       offer     = "RHEL"
#       sku       = "8.2"
#       version   = "latest"
#     },

#     rhel82-gen2 = {
#       publisher = "RedHat"
#       offer     = "RHEL"
#       sku       = "82gen2"
#       version   = "latest"
#     },

#     rhel83 = {
#       publisher = "RedHat"
#       offer     = "RHEL"
#       sku       = "8.3"
#       version   = "latest"
#     },

#     rhel83-gen2 = {
#       publisher = "RedHat"
#       offer     = "RHEL"
#       sku       = "83gen2"
#       version   = "latest"
#     },

#     rhel84 = {
#       publisher = "RedHat"
#       offer     = "RHEL"
#       sku       = "8.4"
#       version   = "latest"
#     },

#     rhel84-gen2 = {
#       publisher = "RedHat"
#       offer     = "RHEL"
#       sku       = "84gen2"
#       version   = "latest"
#     },

#     rhel84-byos = {
#       publisher = "RedHat"
#       offer     = "rhel-byos"
#       sku       = "rhel-lvm84"
#       version   = "latest"
#     },

#     rhel84-byos-gen2 = {
#       publisher = "RedHat"
#       offer     = "rhel-byos"
#       sku       = "rhel-lvm84-gen2"
#       version   = "latest"
#     },

#     mssql2019ent-rhel8 = {
#       publisher = "MicrosoftSQLServer"
#       offer     = "sql2019-rhel8"
#       sku       = "enterprise"
#       version   = "latest"
#     },

#     mssql2019std-rhel8 = {
#       publisher = "MicrosoftSQLServer"
#       offer     = "sql2019-rhel8"
#       sku       = "standard"
#       version   = "latest"
#     },

#     mssql2019dev-rhel8 = {
#       publisher = "MicrosoftSQLServer"
#       offer     = "sql2019-rhel8"
#       sku       = "sqldev"
#       version   = "latest"
#     },

#     mssql2019ent-ubuntu1804 = {
#       publisher = "MicrosoftSQLServer"
#       offer     = "sql2019-ubuntu1804"
#       sku       = "enterprise"
#       version   = "latest"
#     },

#     mssql2019std-ubuntu1804 = {
#       publisher = "MicrosoftSQLServer"
#       offer     = "sql2019-ubuntu1804"
#       sku       = "standard"
#       version   = "latest"
#     },

#     mssql2019dev-ubuntu1804 = {
#       publisher = "MicrosoftSQLServer"
#       offer     = "sql2019-ubuntu1804"
#       sku       = "sqldev"
#       version   = "latest"
#     },

#     mssql2019ent-ubuntu2004 = {
#       publisher = "MicrosoftSQLServer"
#       offer     = "sql2019-ubuntu2004"
#       sku       = "enterprise"
#       version   = "latest"
#     },

#     mssql2019std-ubuntu2004 = {
#       publisher = "MicrosoftSQLServer"
#       offer     = "sql2019-ubuntu2004"
#       sku       = "standard"
#       version   = "latest"
#     },

#     mssql2019dev-ubuntu2004 = {
#       publisher = "MicrosoftSQLServer"
#       offer     = "sql2019-ubuntu2004"
#       sku       = "sqldev"
#       version   = "latest"
#     },
#   }