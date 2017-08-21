package com.teamwork.pojo;

import java.util.Date;

public class Task {
    private String id;

    private String projectName;

    private String title;

    private String description;

    private String status;

    private String progress;

    private String priority;

    private String assignTo;

    private String follower;

    private String createBy;

    private Date createDate;

    private String updateBy;

    private Date updateDate;

    private String expectFinishDate;

    private String realFinishDate;

    private String finishInfo;

    private String finishLink;

    private String delFlag;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName == null ? null : projectName.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getProgress() {
        return progress;
    }

    public void setProgress(String progress) {
        this.progress = progress == null ? null : progress.trim();
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority == null ? null : priority.trim();
    }

    public String getAssignTo() {
        return assignTo;
    }

    public void setAssignTo(String assignTo) {
        this.assignTo = assignTo == null ? null : assignTo.trim();
    }

    public String getFollower() {
        return follower;
    }

    public void setFollower(String follower) {
        this.follower = follower == null ? null : follower.trim();
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy == null ? null : createBy.trim();
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy == null ? null : updateBy.trim();
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getExpectFinishDate() {
        return expectFinishDate;
    }

    public void setExpectFinishDate(String expectFinishDate) {
        this.expectFinishDate = expectFinishDate == null ? null : expectFinishDate.trim();
    }

    public String getRealFinishDate() {
        return realFinishDate;
    }

    public void setRealFinishDate(String realFinishDate) {
        this.realFinishDate = realFinishDate == null ? null : realFinishDate.trim();
    }

    public String getFinishInfo() {
        return finishInfo;
    }

    public void setFinishInfo(String finishInfo) {
        this.finishInfo = finishInfo == null ? null : finishInfo.trim();
    }

    public String getFinishLink() {
        return finishLink;
    }

    public void setFinishLink(String finishLink) {
        this.finishLink = finishLink == null ? null : finishLink.trim();
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag == null ? null : delFlag.trim();
    }
}