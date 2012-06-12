#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "atasmart.h"

/* XS generated by Inline::C2XS */

SkDisk *_c_disk_open(const char *device) {
	SkDisk *disk;
	if ( sk_disk_open(device, &disk) == -1 ) {
		return 0;
	}
	
	return disk;
}

int _c_read_data(SkDisk *disk) {
	
	if (sk_disk_smart_read_data(disk) < 0) {
        return -1;
    }

    return 0;
}

int _c_parse_data(SkDisk *disk) {
	const SkSmartParsedData *parsed_data;
	if (sk_disk_smart_parse(disk, &parsed_data) < 0) {
        return -1;
    }

    return 0;
}

int _c_smart_is_available(SkDisk *disk) {
	SkBool available;
	if (sk_disk_smart_is_available(disk, &available) < 0) {
        return -1;
    }

    return available ? 1 : 0;
}

uint64_t _c_get_size(SkDisk *disk) {
	uint64_t bytes;	
	if (sk_disk_get_size(disk, &bytes) == 0) {
		return bytes;
	} else {
		return -1;
	}
}

int _c_check_sleep_mode(SkDisk *disk) {
	SkBool awake;
	if (sk_disk_check_sleep_mode(disk, &awake) < 0) {
        return -1;
    }

    return awake ? 1 : 0;
}

void _c_disk_dump(SkDisk *disk) {
	sk_disk_dump(disk);
}

int _c_smart_status(SkDisk *disk) {
	SkBool good;
	if (sk_disk_smart_status(disk, &good) < 0) {
        return -1;
    }

    return good ? 1 : 0;
}

uint64_t _c_get_temperature(SkDisk *disk) {
	uint64_t mkelvin;
	
	if (sk_disk_smart_get_temperature(disk, &mkelvin) == 0) {
		return mkelvin;
	} else {
		return (uint64_t) -1;
	}
}

uint64_t _c_get_bad(SkDisk *disk) {
	uint64_t sectors;
	
	if (sk_disk_smart_get_bad(disk, &sectors) == 0) {
		return sectors;
	} else {
		return (uint64_t) -1;
	}
}

int _c_get_overall(SkDisk *disk) {
    SkSmartOverall overall;
    if (sk_disk_smart_get_overall(disk, &overall) < 0) {
		return -1;
	}
	return overall;
}

uint64_t _c_get_power_cycle(SkDisk *disk) {
    uint64_t count;
    if (sk_disk_smart_get_power_cycle(disk, &count) < 0) {
		return (uint64_t) -1;
	}
	return count;
}

uint64_t _c_get_power_on(SkDisk *disk) {
    uint64_t ms;
    if (sk_disk_smart_get_power_on(disk, &ms) < 0) {
		return (uint64_t) -1;
	}
	return ms;
}

int _c_self_test(SkDisk *disk, SkSmartSelfTest test) {
	return sk_disk_smart_self_test(disk, test);
}

void _c_disk_free(SkDisk *disk) {
	return sk_disk_free(disk);
}

/*
const char* sk_smart_overall_to_string(SkSmartOverall overall);
int sk_disk_identify_is_available(SkDisk *d, SkBool *available);
int sk_disk_identify_parse(SkDisk *d, const SkIdentifyParsedData **data);
typedef void (*SkSmartAttributeParseCallback)(SkDisk *d, const SkSmartAttributeParsedData *a, void* userdata);
int sk_disk_get_blob(SkDisk *d, const void **blob, size_t *size);
int sk_disk_set_blob(SkDisk *d, const void *blob, size_t size);
int sk_disk_smart_parse_attributes(SkDisk *d, SkSmartAttributeParseCallback cb, void* userdata);
*/
MODULE = Linux::AtaSmart	PACKAGE = Linux::AtaSmart	

PROTOTYPES: DISABLE


SkDisk *
_c_disk_open (device)
	const char *	device

int
_c_read_data (disk)
	SkDisk *	disk

int
_c_parse_data (disk)
	SkDisk *	disk

int
_c_smart_is_available (disk)
	SkDisk *	disk

uint64_t
_c_get_size (disk)
	SkDisk *	disk

int
_c_check_sleep_mode (disk)
	SkDisk *	disk

void
_c_disk_dump (disk)
	SkDisk *	disk
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	_c_disk_dump(disk);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

int
_c_smart_status (disk)
	SkDisk *	disk

uint64_t
_c_get_temperature (disk)
	SkDisk *	disk

uint64_t
_c_get_bad (disk)
	SkDisk *	disk

int
_c_get_overall (disk)
	SkDisk *	disk

uint64_t
_c_get_power_cycle (disk)
	SkDisk *	disk

uint64_t
_c_get_power_on (disk)
	SkDisk *	disk

int
_c_self_test (disk, test)
	SkDisk *	disk
	SkSmartSelfTest	test

void
_c_disk_free (disk)
	SkDisk *	disk
