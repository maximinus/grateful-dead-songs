
// our mount point is the div 'results-block'

var ShowDate = React.createClass({
	render: function() {
		return(
			<a className="result" href="/">
				{this.props.text}
			</a>
		);
	}
})

var ShowsInYear = React.createClass({
	getTitle: function() {
		if(this.shows.length == 0) {
			return('No Shows found.'); }
		else {
			return('Found ' + this.shows.length.toString() + ' shows - click one to edit');
		}
	},

	getInitialState: function() {
		return {shows:[''], title:''};
	},

	render: function() {
		console.log('Rendering');
		return(
			<div className="results-table">
				<h3 className="results-title">{this.state.title}</h3>
				{this.state.shows.map(function(text) {
					return <ShowDate text={text} />;
    			})}
			</div>
		);
	}
});

ReactDOM.render(
	<ShowsInYear />,
	document.getElementById('results-block')
);
