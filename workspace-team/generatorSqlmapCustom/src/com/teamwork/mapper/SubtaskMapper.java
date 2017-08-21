package com.teamwork.mapper;

import com.teamwork.pojo.Subtask;
import com.teamwork.pojo.SubtaskExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SubtaskMapper {
    int countByExample(SubtaskExample example);

    int deleteByExample(SubtaskExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Subtask record);

    int insertSelective(Subtask record);

    List<Subtask> selectByExample(SubtaskExample example);

    Subtask selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Subtask record, @Param("example") SubtaskExample example);

    int updateByExample(@Param("record") Subtask record, @Param("example") SubtaskExample example);

    int updateByPrimaryKeySelective(Subtask record);

    int updateByPrimaryKey(Subtask record);
}