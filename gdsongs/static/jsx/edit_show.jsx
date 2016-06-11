
var colors = ["Red","Green","Blue","Yellow","Black","White","Orange"];

var ShowEditor = React.createClass({
	getInitialState: function() {
		return({data:this.props.data});
	},

	dragEnd: function() {
		console.log('drag end');
	},

	dragStart: function() {
		console.log('drag start');
	},

	deagOver: function() {
		console.log('drag over');
	},

	render: function() {
		return(
			<ul onDragOver={this.dragOver}>
				{this.state.data.map(function(item, index) {	
					return(
						<li draggable="true" onDragEnd={this.dragEnd} onDragStart={this.dragStart} key={index}>{item}</li>
					)
				}, this) }
			</ul>
		);
  },
});

ReactDOM.render(<ShowEditor data={colors} />, document.getElementById('react-main'));
