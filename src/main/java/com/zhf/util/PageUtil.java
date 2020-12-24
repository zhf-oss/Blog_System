package com.zhf.util;

/**
 * 分页工具类
 * @author Administrator
 *
 */
public class PageUtil {

	/**
	 * 生成分页代码
	 *
	 * @param targetUrl   目标地址
	 * @param totalNum    总记录数
	 * @param currentPage 当前页
	 * @param pageSize    每页大小
	 * @return
	 */
	public static String genPagination(String targetUrl, long totalNum, int currentPage, int pageSize, String param) {
		long totalPage = totalNum % pageSize == 0 ? totalNum / pageSize : totalNum / pageSize + 1;

		if (totalPage == 0) {
			return "未查询到数据";
		} else {
			StringBuffer pageCode = new StringBuffer();
			if (currentPage == 1) {
				pageCode.append("<a class='extend next' href='#' style='pointer-events: none;'><i class='fas fa-angle-left'></i></a>");
			} else {
				pageCode.append("<a class='extend next' href='" + targetUrl + "?page=" + (currentPage - 1) + "'><i class='fas fa-angle-left'></i></a>");
			}

			for (int i = currentPage - 2; i <= currentPage + 2; i++) {
				if (i < 1 || i > totalPage) {
					continue;
				}
				if (i == currentPage) {
					pageCode.append("<a class='page-number current' href='" + targetUrl + "?page=" + i + "'>" + i + "</a>");
				} else {
					pageCode.append("<a class='page-number' href='" + targetUrl + "?page=" + i + "'>" + i + "</a>");
				}
			}

			if (currentPage == totalPage) {
				pageCode.append("<a class='extend next' href='#' style='pointer-events: none;'><i class='fas fa-angle-right'></i></a>");
			} else {
				pageCode.append("<a class='extend next' href='" + targetUrl + "?page=" + (currentPage + 1) + "'><i class='fas fa-angle-right'></i></a>");
			}
			return pageCode.toString();
		}

	}
}
