<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="@packageDir.dao.@objectNameUDao">

    <select id="query@objectNameUPage" parameterType="@packageDir.model.@objectNameU" resultType="@packageDir.model.@objectNameU">
        select * from @tableName where 1=1
        <L>
            <LP>
                <if test="@fieldNameA!=null">
                    and @fieldNameA=#{@fieldNameA}
                </if>
            </LP>
            <LA>
                <if test="@fieldNameA!=null">
                    and @fieldNameA=#{@fieldNameA}
                </if>
            </LA>
        </L>
    </select>

    <select id="existed@objectNameU" parameterType="@packageDir.model.@objectNameU" resultType="boolean">
        select count(*) from " + @tableName
        <L>
            <LP>
                where @fieldNameA != " + #{@fieldNameL}
            </LP>
            <LS>
                and @fieldNameA = #{@fieldNameL}
            </LS>
            <LT>
                and @fieldNameA = #{@fieldNameL}
            </LT>
            <LN>
                and @fieldNameA = #{@fieldNameL}
            </LN>
        </L>
    </select>

    <insert id="insert@objectNameU" parameterType="@packageDir.model.@objectNameU" useGeneratedKeys="true" keyColumn="id"
            keyProperty="id">
        insert into @tableName(
        <L>
            <LP>
                @fieldNameA
            </LP>
            <LA>
                ,@fieldNameA
            </LA>
        </L>
        )
        values(
        <L>
            <LP>
                #{@fieldNameL}
            </LP>
            <LS>
                ,#{@fieldNameL}
            </LS>
            <LT>
                ,#{@fieldNameL}
            </LT>
            <LN>
                ,#{@fieldNameL}
            </LN>
        </L>
        )
    </insert>

    <update id="update@objectNameU" parameterType="@packageDir.model.@objectNameU" useGeneratedKeys="true" keyColumn="id" keyProperty="id">
        update @tableName set
        <L>
            <LP>
                @fieldNameA = #{@fieldNameL}
            </LP>
            <LS>
                ,@fieldNameA = #{@fieldNameL}
            </LS>
            <LT>
                ,@fieldNameA = #{@fieldNameL}
            </LT>
            <LN>
                ,@fieldNameA = #{@fieldNameL}
            </LN>
        </L>
        where @pFieldName = #{@pObjectNameL};
    </update>

    <delete id="delete@objectNameU" parameterType="long">
        delete from @tableName where id = #{@objectNameLID}
    </delete>

</mapper>