orbis_chk_currentVersion = 31;
orbis_chk_url = "http://cafe.naver.com/kimchiguys?iframe_url=/ArticleList.nhn%3Fsearch.clubid=24983981%26search.menuid=1%26search.boardtype=L";
orbis_chk_whitelist = ["brg_africa"];
orbis_chk_blacklist = ["Ryanzombies"];

[] spawn {
	sleep 0.1;
	call orbis_chk_fnc_checkClasses;
};
