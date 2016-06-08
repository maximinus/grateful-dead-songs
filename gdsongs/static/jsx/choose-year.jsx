
// our mount point is the div 'results-block'

var ShowDate = React.createClass({
	render: function() {
		console.log(this.props);
		return(
			<a className="result" href="/edit_show/{this.props.key}/">
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

	selectYear: function(event) {
		var year = event.currentTarget.innerHTML
		// ajax the year and get the shows
		var url = '/shows/year/' + year + '/';
		$.ajax(url, {'type':'GET', 'success':this.gotData });
	},

	gotData: function(data) {
		data.title = 'Found ' + data.shows.length + ' shows from ' + data.year;
		this.setState(data);
	},

	componentDidMount: function() {
		$('.year').click(this.selectYear);
	},

	getInitialState: function() {
		return({shows:[''], title:''});
	},

	render: function() {
		return(
			<div className="results-table">
				<h3 className="results-title">{this.state.title}</h3>
				{this.state.shows.map(function(show) {
					return <ShowDate text={show.date} key={show.id} />;
    			})}
			</div>
		);
	}
});

ReactDOM.render(
	<ShowsInYear />,
	document.getElementById('results-block')
);
