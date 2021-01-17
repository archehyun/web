/**
 * 
 */

var fn_select;
var fn_select_detail;
var fn_delete;
var fn_insert;
var gfn_transaction;
var fn_callback;
var fn_select2 = function(url)
{

}

function promise()
{
	return new Promise(function(transaction){

	})
}

var transaction =  function(datas, fn_callback)
{

	return new Promise(function(fn_callback){

		fn_callback(datas.svcid);
	})
}


gfn_transaction =  async function(url,  datas, fn_callback) {

	var marster = datas.args;


	//console.log("name:"+datas.name);

	//console.log("master:"+typeof marster);

	//console.log("input_value:"+marster.input_value);

	var form = document.createElement("form");

	form.setAttribute("charset", "UTF-8");

	form.setAttribute("method", "POST"); // Get 또는 Post 입력

	form.setAttribute("action", url);

	console.log("action:"+form.getAttribute("action"));

	for(let property in  marster){

		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", property);
		hiddenField.setAttribute("value", encodeURI(marster[property]));
		form.appendChild(hiddenField);
		console.log("name:"+property+", value:"+ marster[property]);
	}



	var title = '';
	form.target = title;
	document.body.appendChild(form);
	form.submit();	
	fn_callback(datas.svcid);
	const num = await transaction(datas, fn_callback);
	//transaction(datas, fn_callback);
	//console.log("gfn_transaction:"+num);


}