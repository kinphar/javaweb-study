package com.teamwork.mapper;

import com.teamwork.pojo.TaskCheckList;
import com.teamwork.pojo.TaskCheckListExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TaskCheckListMapper {
    int countByExample(TaskCheckListExample example);

    int deleteByExample(TaskCheckListExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TaskCheckList record);

    int insertSelective(TaskCheckList record);

    List<TaskCheckList> selectByExample(TaskCheckListExample example);

    TaskCheckList selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TaskCheckList record, @Param("example") TaskCheckListExample example);

    int updateByExample(@Param("record") TaskCheckList record, @Param("example") TaskCheckListExample example);

    int updateByPrimaryKeySelective(TaskCheckList record);

    int updateByPrimaryKey(TaskCheckList record);
}