"use strict";

var Button = React.createClass({
	displayName: "Button",

	render: function render() {
		return React.createElement(
			"button",
			null,
			"Go"
		);
	} });

React.render(React.createElement(Button, null), document.getElementById("root"));