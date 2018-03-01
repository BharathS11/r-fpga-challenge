#!/bin/sh
PROJECT="badprog1"
TOP_LEVEL_ENTITY="badprog1.v"
DEVICE_FAMILY="Arria II"
DEVICE_PART="EP2C20F484C7"
PACKING_OPTION="minimize_area"
quartus_map $PROJECT --source="$TOP_LEVEL_ENTITY" --family="$DEVICE_FAMILY"
quartus_fit $PROJECT --pack_register="$PACKING_OPTION"
quartus_asm $PROJECT
quartus_sta $PROJECT
