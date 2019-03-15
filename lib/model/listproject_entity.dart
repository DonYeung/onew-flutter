class ListprojectEntity {
	ListprojectData data;
	int errorcode;
	String errormsg;

	ListprojectEntity({this.data, this.errorcode, this.errormsg});

	ListprojectEntity.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new ListprojectData.fromJson(json['data']) : null;
		errorcode = json['errorCode'];
		errormsg = json['errorMsg'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		data['errorCode'] = this.errorcode;
		data['errorMsg'] = this.errormsg;
		return data;
	}
}

class ListprojectData {
	bool over;
	int pagecount;
	int total;
	int curpage;
	int offset;
	int size;
	List<ListprojectDataData> datas;

	ListprojectData({this.over, this.pagecount, this.total, this.curpage, this.offset, this.size, this.datas});

	ListprojectData.fromJson(Map<String, dynamic> json) {
		over = json['over'];
		pagecount = json['pageCount'];
		total = json['total'];
		curpage = json['curPage'];
		offset = json['offset'];
		size = json['size'];
		if (json['datas'] != null) {
			datas = new List<ListprojectDataData>();
			(json['datas'] as List).forEach((v) { datas.add(new ListprojectDataData.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['over'] = this.over;
		data['pageCount'] = this.pagecount;
		data['total'] = this.total;
		data['curPage'] = this.curpage;
		data['offset'] = this.offset;
		data['size'] = this.size;
		if (this.datas != null) {
      data['datas'] = this.datas.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class ListprojectDataData {
	String superchaptername;
	int publishtime;
	int visible;
	String nicedate;
	String projectlink;
	String author;
	int zan;
	String origin;
	String chaptername;
	String link;
	String title;
	int type;
	int userid;
	List<ListprojectDataDatasTag> tags;
	String apklink;
	String envelopepic;
	int chapterid;
	int superchapterid;
	int id;
	bool fresh;
	bool collect;
	int courseid;
	String desc;

	ListprojectDataData({this.superchaptername, this.publishtime, this.visible, this.nicedate, this.projectlink, this.author, this.zan, this.origin, this.chaptername, this.link, this.title, this.type, this.userid, this.tags, this.apklink, this.envelopepic, this.chapterid, this.superchapterid, this.id, this.fresh, this.collect, this.courseid, this.desc});

	ListprojectDataData.fromJson(Map<String, dynamic> json) {
		superchaptername = json['superChapterName'];
		publishtime = json['publishTime'];
		visible = json['visible'];
		nicedate = json['niceDate'];
		projectlink = json['projectLink'];
		author = json['author'];
		zan = json['zan'];
		origin = json['origin'];
		chaptername = json['chapterName'];
		link = json['link'];
		title = json['title'];
		type = json['type'];
		userid = json['userId'];
		if (json['tags'] != null) {
			tags = new List<ListprojectDataDatasTag>();
			(json['tags'] as List).forEach((v) { tags.add(new ListprojectDataDatasTag.fromJson(v)); });
		}
		apklink = json['apkLink'];
		envelopepic = json['envelopePic'];
		chapterid = json['chapterId'];
		superchapterid = json['superChapterId'];
		id = json['id'];
		fresh = json['fresh'];
		collect = json['collect'];
		courseid = json['courseId'];
		desc = json['desc'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['superChapterName'] = this.superchaptername;
		data['publishTime'] = this.publishtime;
		data['visible'] = this.visible;
		data['niceDate'] = this.nicedate;
		data['projectLink'] = this.projectlink;
		data['author'] = this.author;
		data['zan'] = this.zan;
		data['origin'] = this.origin;
		data['chapterName'] = this.chaptername;
		data['link'] = this.link;
		data['title'] = this.title;
		data['type'] = this.type;
		data['userId'] = this.userid;
		if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
		data['apkLink'] = this.apklink;
		data['envelopePic'] = this.envelopepic;
		data['chapterId'] = this.chapterid;
		data['superChapterId'] = this.superchapterid;
		data['id'] = this.id;
		data['fresh'] = this.fresh;
		data['collect'] = this.collect;
		data['courseId'] = this.courseid;
		data['desc'] = this.desc;
		return data;
	}
}

class ListprojectDataDatasTag {
	String name;
	String url;

	ListprojectDataDatasTag({this.name, this.url});

	ListprojectDataDatasTag.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['url'] = this.url;
		return data;
	}
}
