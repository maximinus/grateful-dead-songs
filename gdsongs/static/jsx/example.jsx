
var Row = react.createClass({
	render: function() {
		return <tr class="data-row">
				   <td><div class="form-group"><input list="songs" class="form-control song-val" /></div></td>
				   <td><div class="form-group"><input type="checkbox" class="form-control seque-val" value="seque" /></div></td>
				   <td><div class="form-group"><input type="text" class="form-control length-val" /></div></td>
				   <td><div class="form-group"><input type="text" class="form-control comment-val" /></div></td>
				   <td>
					   <button type="button" class="btn btn-default move-up-button" aria-label="Left Align" data-toggle="tooltip" title="Move up">
						   <span class="glyphicon glyphicon-arrow-up" aria-hidden="true"></span>
					   </button>
				   </td>
				   <td>
					   <button type="button" class="btn btn-default move-down-button" aria-label="Left Align" data-toggle="tooltip" title="Move down">
						   <span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span>
					   </button>
				   </td>
				   <td>
					   <button type="button" class="btn btn-danger delete-button" aria-label="Left Align" data-toggle="tooltip" title="Delete song">
						   <span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>
					   </button>
				   </td>
				   <td>
					   <button type="button" class="btn btn-primary add-row-button" aria-label="Left Align"  data-toggle="tooltip" title="Add row">
						   <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
					   </button>
				   </td>
			   </tr>;
	}
});

ReactDOM.render(<Row>, mountNode);

