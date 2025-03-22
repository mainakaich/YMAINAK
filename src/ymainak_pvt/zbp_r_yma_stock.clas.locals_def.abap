*"* use this source file for any type of declarations (class
*"* definitions, interfaces or type declarations) you need for
*"* components in the private section
    TYPES: BEGIN OF ty_key,
             id       TYPE sysuuid_x16,
             is_draft TYPE abp_behv_flag,
           END OF ty_key.
