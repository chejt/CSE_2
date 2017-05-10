/**
 * 分页入口
 * @param currentpage  当前页
 * @param totalpage  总页数
 */
function initPage(currentpage, totalpage){
	if(totalpage == 0) return;
	var sbf = new StringBuffer();
	if(currentpage == 1){
		sbf.append("<a href=\"javascript:void(0);\" id=\"startpage\">First Page</a>");
		sbf.append("<a href=\"javascript:void(0);\" id=\"lastpage\">Page Up</a>");
	}
	else{
		sbf.append("<a href=\"javascript:topage(1);\" id=\"startpage\">First Page</a>");
		sbf.append("<a href=\"javascript:topage(");
		sbf.append(currentpage-1);
		sbf.append(");\" id=\"lastpage\">Page Up</a>");
	}
	/** 遍历页数---开始 */
	if(totalpage < 11){
		for(var i=1; i<=totalpage; i++){
			i == currentpage ? sbf.append(current_Y(i)) : sbf.append(current_N(i));
		}
	}else if(totalpage - currentpage < 5){
		for(var i=currentpage-4; i<=totalpage; i++){
			i == currentpage ? sbf.append(current_Y(i)) : sbf.append(current_N(i));
		}
	}else if(currentpage > 4){
		for(var i=currentpage-4; i<=currentpage+5; i++){
			i == currentpage ? sbf.append(current_Y(i)) : sbf.append(current_N(i));
		}
	}else{
		for(var i=1; i<=10; i++){
			i == currentpage ? sbf.append(current_Y(i)) : sbf.append(current_N(i));
		}
	}
	/** 遍历页数---结束 */
	if(currentpage == totalpage){
		sbf.append("<a href=\"javascript:void(0);\" id=\"nextpage\">Page Down</a>");
		sbf.append("<a href=\"javascript:void(0);\" id=\"endpage\">Last Page</a>");
	}else{
		sbf.append("<a href=\"javascript:topage(");
		sbf.append(currentpage+1);
		sbf.append(");\" id=\"nextpage\">Page Down</a>");
		sbf.append("<a href=\"javascript:topage(");
		sbf.append(totalpage);
		sbf.append(");\" id=\"endpage\">Last Page</a>");
	}
	if(totalpage == 1) {
		$(".mainlist_page").html("<a href=\"javascript:void(0);\">1</a>");
	} else {
		$(".mainlist_page").html(sbf.toString());
	}

}

/**
 * 是当前页
 * @param index 页号
 * @returns {String}
 */
function current_Y(index){
	var str = "<a href=\"javascript:void(0);\" class=\"page_current\">" + index + "</a>";
	return str;
}

/**
 * 不是当前页
 * @param index 页号
 * @returns {String}
 */
function current_N(index){
	var str = "<a href=\"javascript:topage(" + index + ");\">" + index + "</a>";
	return str;
}

/** 构建一个StringBuffer类-----开始 */
function StringBuffer(){ 
	this.content = new Array; 
}
StringBuffer.prototype.append = function(str){ 
	this.content.push(str);
}
StringBuffer.prototype.toString = function(){
	return this.content.join("");
}
StringBuffer.prototype.clear = function(){
    this.content = [];
};
