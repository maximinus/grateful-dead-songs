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

QUnit.test("getDigits tests", function(assert) {
	assert.equal(getDigits('123'), 123, "One digit ok");
	assert.equal(getDigits('123'), 123, "Two digits ok");
	assert.equal(getDigits('123'), 123, "Three digits ok");
	assert.equal(getDigits('-123'), -1, "No negative numbers");
	assert.equal(getDigits('1 2 3'), -1, "No spaces");
	assert.equal(getDigits('Hello'), -1, "No strings");
	assert.equal(getDigits(''), -1, "No empty string");
})

QUnit.test("checkLength tests", function(assert) {
	// this is for getting the length of a song.
	assert.equal(checkLength('30'), 30, "Only seconds");
	assert.equal(checkLength('1:30'), 90, "Minute and seconds");
	assert.equal(checkLength('10:30'), 630, "Minute and seconds");
	assert.equal(checkLength('-30'), -1, "No negatives");
	assert.equal(checkLength('Hello!'), -1, "No strings");
	assert.equal(checkLength('546198'), -1, "Number too big");
	assert.equal(checkLength('2346:30'), -1, "Minutes too big");
	assert.equal(checkLength('8:13:12:30'), -1, "Too many values");
	assert.equal(checkLength(''), -1, "No empty string");
});
