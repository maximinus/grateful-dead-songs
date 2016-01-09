"use strict";

QUnit.test("Leap year tests", function(assert) {
	assert.equal(isLeapYear(1988), true, "1988 is a leap year");
	assert.equal(isLeapYear(1989), false, "1989 is not a leap year");
});

QUnit.test("Validate Dates", function(assert) {
	// format is day, month, year
	assert.equal(validateDate(0,1,1990), false, "No 0 day");
	assert.equal(validateDate(1,0,1990), false, "No 0 month");
	assert.equal(validateDate(1,1,0), false, "No 0 year");
	assert.equal(validateDate(30,2,1990), false, "Short February");
	assert.equal(validateDate(29,2,1988), true, "Leap day");
	assert.equal(validateDate(40,1,1990), false, "Day too high");
	assert.equal(validateDate(1,13,1990), false, "Month too high");
	assert.equal(validateDate(-4,1,1990), false, "Negative day");
	assert.equal(validateDate(13,2,1970), true, "A real day");
});
