<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<body>

<%--  <div class="pst">
      <span class="cateTitle"></span>
      <div class="pst_m">
          <div class="r_search">
              <input name="" type="text" placeholder="请输入关键字">
              <input name="" type="submit" value="搜 索">
          </div>
      </div>
  </div>--%>
<div class="scd_m">
    <ul class="pro clearfix" id="findDetail">

    </ul>
    <div class="pages">
        <span class="page-no"></span>
    </div>

</div>

</body>
</html>
<script>
    function getList(category_id, cateName) {
        var lilength = $("#nav_fk").find("li").length;
        if (lilength > 0) {
            for (var i = 0; i < lilength; i++) {
                $("#nav_fk").find("li:eq(" + i + ")").removeClass();
                $("#nav_fk").find("li:eq(" + i + ")").addClass("hot");
            }
        }
        $("#li_" + category_id).removeClass();
        $("#li_" + category_id).addClass("now");
        $.ajax({
            url: '/device/findByDevice?categoryId=' + category_id + "&pageNo=" + 1 + "&pageSize=" + 4,
            type: 'GET',
            success: function (result) {
                $("#findDetail").find("li").remove();
                if (result.list.length > 0) {
                    loadPage(1, result.firstPage, result.lastPage, '/device/findByDevice?categoryId=' + category_id, "cateList", category_id, cateName)
                } else {
                    $(".page-no").find("a").remove();
                }

            }
        })

    }


</script>