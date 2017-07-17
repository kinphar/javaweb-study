package com.teamwork.mapper;

import com.teamwork.pojo.TaskChecklist;
import com.teamwork.pojo.TaskChecklistExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TaskChecklistMapper {
    int countByExample(TaskChecklistExample example);

    int deleteByExample(TaskChecklistExample example);

    int deleteByPrimaryKey(String id);

    int insert(TaskChecklist record);

    int insertSelective(TaskChecklist record);

    List<TaskChecklist> selectByExample(TaskChecklistExample example);

    TaskChecklist selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") TaskChecklist record, @Param("example") TaskChecklistExample example);

    int updateByExample(@Param("record") TaskChecklist record, @Param("example") TaskChecklistExample example);

    int updateByPrimaryKeySelective(TaskChecklist record);

    int updateByPrimaryKey(TaskChecklist record);
}