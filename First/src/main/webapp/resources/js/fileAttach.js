	function printFiles(data, path){
		
		var fileInfo = getFileInfo(data,path);
		console.log(fileInfo);
		var html = fileTemplate(fileInfo);
		html += "<input type = 'hidden' class='file' value='"+fileInfo.fullName+"'>";
		$(".uploadedList").append(html);
		if(fileInfo.fullName.substr(12,2)==="s_"){
			var that =$(".uploadedList li").last();			
			that.find(".fa-paperclip").attr("class","fa fa-camera");
		}
	}
	function getFileInfo(fullName,path){
		var originalFileName;
		var imgSrc;
		var originalFileUrl;
		var uuidFileName;
		var basicFileName =fullName;
		if(checkImageType(fullName)){
			imgSrc = path+"/upload/displayFile?fileName="+fullName;
			uuidFileName = fullName.substr(14);
			var originalImg =fullName.substr(0,12) + uuidFileName;
			originalFileUrl =path+"/upload/displayFile?fileName="+originalImg;
		}else{
			imgSrc = path+"/resources/img/file-icon.png";
			uuidFileName = fullName.substr(12);
			originalFileUrl = path+"/upload/displayFile?fileName="+fullName;
		}
		originalFileName = uuidFileName.substr(uuidFileName.indexOf("_")+1)
		if(originalFileName.length>14){
			var shortName = originalFileName.substr(0,10);
			var formatVal = originalFileName.split(".");
			var arrNum = formatVal.length -1;
			originalFileName = shortName+"..."+formatVal[arrNum];
		}
		return {originalFileName: originalFileName, imgSrc:imgSrc,originalFileUrl:originalFileUrl,fullName:fullName,basicFileName:basicFileName};
	}
	function getOriginalName(fileName){
		if(checkImageType(fileName)){
			return;
		}
		var idx = fileName.indexOf("_")+1;
		return fileName.substr(idx);
	}
	function getImageLink(fileName){
		if(!checkImageType(fileName)){
			return;
		}
		var front = fileName.substr(0,12);
		var end = fileName.substr(14);
		return fornt+end;
	}
	function checkImageType(fileName){
		var pattern =/jpg|gif|png|jpeg/i;
		return fileName.match(pattern);
	}
	function listAttach(path,bno){
		var listCnt = 0;
		$.ajax({
			type: "POST",
			url: path+"/board/getAttach?bno="+bno,
			async:false,
			success:function(list){
				listCnt = list.length;
				$(list).each(function(i,e){
					printFiles(e,path);
				});
			}
		});
		
		return listCnt;
	}