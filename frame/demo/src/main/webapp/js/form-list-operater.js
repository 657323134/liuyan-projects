/*列表数据操作*/
/**
 * 根据dataId删除数据
 * @param dataId 数据Id
 * @param url 删除请求url
 * @param gourl 删除成功后跳转
 */
function deleteForm(dataId, url, gourl) {
    if (window.confirm('确定要该记录吗？')) {
        $.post(url, {id: dataId}, function (result) {
            alert(result.info);
            if (null != gourl) {
                goUrl(gourl);
            }
        });
        return true;
    } else {
        return false;
    }
}