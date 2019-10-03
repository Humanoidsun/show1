/**
 * Created by wph-pc on 2018/3/22.
 */

function ClientStorage() {

}
ClientStorage.prototype.putJSON=function(key,object)
{
    localStorage.setItem(key,JSON.stringify(object));
}
ClientStorage.prototype.put=function(key,object)
{
    localStorage.setItem(key,object);
}
ClientStorage.prototype.getJSON=function(key)
{
    if (key==undefined || key==null || key=="" || localStorage.getItem(key)==null)
        return null;
    return JSON.parse(localStorage.getItem(key));
}
ClientStorage.prototype.get=function(key)
{
    return localStorage.getItem(key);
}
ClientStorage.prototype.remove=function(key)
{
    localStorage.removeItem(key);
}
/*查询数据源source中以fieldName属性名的属性值fieldValue的数据是否存在，
如果存在，返回该对象，否则返回空*/
ClientStorage.prototype.getObjectFromArrayByField=function(source,fieldName,fieldValue)
{
    if (source==undefined || source==null || source.length==0) return null;
    for(var i=0;i<source.length;i++)
    {
        var temp=$(source[i]).attr(fieldName);
        if (temp==undefined) return null;
        if (temp==fieldValue) return source[i];
    }
    return null;
}
/*查询数据源source中以fieldName属性名的属性值fieldValue的数据是否存在，
 如果存在，返回该对象的索引位置，否则返回-1*/
ClientStorage.prototype.getObjectIndexFromArrayByField=function(source,fieldName,fieldValue)
{
    if (source==undefined || source==null || source.length==0) return -1;
    for(var i=0;i<source.length;i++)
    {
        var temp=$(source[i]).attr(fieldName);
        if (temp==undefined) return null;
        if (temp==fieldValue) return i;
    }
    return -1;
}
/*查询数据源source中以fieldName属性名的属性值fieldValue的数据是否存在，
 如果存在，更换新值为newObject,成功返回1，否则返回0*/
ClientStorage.prototype.updateObjectInArray=function(source,fieldName,fieldValue,newObject)
{
    if (source==undefined || source==null || source.length==0) return 0;
    for(var i=0;i<source.length;i++)
    {
        var temp=$(source[i]).attr(fieldName);
        if (temp==undefined) return 0;
        if (temp==fieldValue)
        {
            source[i]=newObject;
            return 1;
        }
    }
    return 0;
}