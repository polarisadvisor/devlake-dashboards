from datetime import datetime
from typing import Optional, List
from models.base import Base
from sqlalchemy import String, Text, BigInteger, Boolean, ForeignKey, JSON
from sqlalchemy.dialects.mysql import DATETIME as MYSQL_DATETIME
from sqlalchemy.orm import Mapped, mapped_column, relationship

class Project(Base):
    __tablename__ = "projects"

    name: Mapped[str] = mapped_column(String(255), primary_key=True)
    description: Mapped[Optional[str]] = mapped_column(Text)
    created_at: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    updated_at: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    _raw_data_params: Mapped[Optional[str]] = mapped_column(String(255))
    _raw_data_table: Mapped[Optional[str]] = mapped_column(String(255))
    _raw_data_id: Mapped[Optional[int]] = mapped_column(BigInteger)
    _raw_data_remark: Mapped[Optional[str]] = mapped_column(Text)

    # relationships
    mappings: Mapped[list["ProjectMapping"]] = relationship(back_populates="project")
    metric_settings: Mapped[list["ProjectMetricSetting"]] = relationship(back_populates="project")
    pr_metrics: Mapped[list["ProjectPRMetric"]] = relationship(back_populates="project")

class ProjectMapping(Base):
    __tablename__ = "project_mapping"

    project_name: Mapped[str] = mapped_column(String(255), ForeignKey("projects.name"), primary_key=True)
    table: Mapped[str] = mapped_column(String(255), primary_key=True)
    row_id: Mapped[str] = mapped_column(String(255), primary_key=True)
    created_at: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    updated_at: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    _raw_data_params: Mapped[Optional[str]] = mapped_column(String(255))
    _raw_data_table: Mapped[Optional[str]] = mapped_column(String(255))
    _raw_data_id: Mapped[Optional[int]] = mapped_column(BigInteger)
    _raw_data_remark: Mapped[Optional[str]] = mapped_column(Text)

    # Relationship
    project: Mapped["Project"] = relationship(back_populates="mappings")


class ProjectMetricSetting(Base):
    __tablename__ = "project_metric_settings"

    project_name: Mapped[str] = mapped_column(String(255), ForeignKey("projects.name"), primary_key=True)
    plugin_name: Mapped[str] = mapped_column(String(255), primary_key=True)
    enable: Mapped[Optional[bool]] = mapped_column(Boolean)
    plugin_option: Mapped[Optional[dict]] = mapped_column(JSON)
    created_at: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    updated_at: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    _raw_data_params: Mapped[Optional[str]] = mapped_column(String(255))
    _raw_data_table: Mapped[Optional[str]] = mapped_column(String(255))
    _raw_data_id: Mapped[Optional[int]] = mapped_column(BigInteger)
    _raw_data_remark: Mapped[Optional[str]] = mapped_column(Text)

    # Relationship
    project: Mapped["Project"] = relationship(back_populates="metric_settings")


class ProjectPRMetric(Base):
    __tablename__ = "project_pr_metrics"

    id: Mapped[str] = mapped_column(String(255), primary_key=True)
    project_name: Mapped[str] = mapped_column(String(100), ForeignKey("projects.name"), primary_key=True)
    first_commit_sha: Mapped[Optional[str]] = mapped_column(Text)
    pr_coding_time: Mapped[Optional[int]] = mapped_column(BigInteger)
    first_review_id: Mapped[Optional[str]] = mapped_column(Text)
    pr_pickup_time: Mapped[Optional[int]] = mapped_column(BigInteger)
    pr_review_time: Mapped[Optional[int]] = mapped_column(BigInteger)
    deployment_commit_id: Mapped[Optional[str]] = mapped_column(Text)
    pr_deploy_time: Mapped[Optional[int]] = mapped_column(BigInteger)
    pr_cycle_time: Mapped[Optional[int]] = mapped_column(BigInteger)
    first_commit_authored_date: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    pr_created_date: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    first_comment_date: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    pr_merged_date: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    pr_deployed_date: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    created_at: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    updated_at: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    _raw_data_params: Mapped[Optional[str]] = mapped_column(String(255))
    _raw_data_table: Mapped[Optional[str]] = mapped_column(String(255))
    _raw_data_id: Mapped[Optional[int]] = mapped_column(BigInteger)
    _raw_data_remark: Mapped[Optional[str]] = mapped_column(Text)

    # Relationship
    project: Mapped["Project"] = relationship(back_populates="pr_metrics")

class PullRequest(Base):
    __tablename__ = "pull_requests"

    id: Mapped[str] = mapped_column(String(255), primary_key=True)
    base_repo_id: Mapped[Optional[str]] = mapped_column(String(191))
    base_ref: Mapped[Optional[str]] = mapped_column(String(255))
    base_commit_sha: Mapped[Optional[str]] = mapped_column(String(40))
    head_repo_id: Mapped[Optional[str]] = mapped_column(String(191))
    head_ref: Mapped[Optional[str]] = mapped_column(String(255))
    head_commit_sha: Mapped[Optional[str]] = mapped_column(String(40))
    merge_commit_sha: Mapped[Optional[str]] = mapped_column(String(40))
    status: Mapped[Optional[str]] = mapped_column(String(100))
    original_status: Mapped[Optional[str]] = mapped_column(String(100))
    type: Mapped[Optional[str]] = mapped_column(String(100))
    component: Mapped[Optional[str]] = mapped_column(String(100))
    title: Mapped[Optional[str]] = mapped_column(Text)
    description: Mapped[Optional[str]] = mapped_column(Text)
    url: Mapped[Optional[str]] = mapped_column(String(255))
    author_name: Mapped[Optional[str]] = mapped_column(String(100))
    author_id: Mapped[Optional[str]] = mapped_column(String(100))
    parent_pr_id: Mapped[Optional[str]] = mapped_column(String(100))
    pull_request_key: Mapped[Optional[int]] = mapped_column(BigInteger)
    created_date: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    merged_date: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    closed_date: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    additions: Mapped[Optional[int]] = mapped_column(BigInteger)
    deletions: Mapped[Optional[int]] = mapped_column(BigInteger)
    merged_by_name: Mapped[Optional[str]] = mapped_column(String(100))
    merged_by_id: Mapped[Optional[str]] = mapped_column(String(100))
    is_draft: Mapped[Optional[bool]] = mapped_column(Boolean)
    created_at: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    updated_at: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    _raw_data_params: Mapped[Optional[str]] = mapped_column(String(255))
    _raw_data_table: Mapped[Optional[str]] = mapped_column(String(255))
    _raw_data_id: Mapped[Optional[int]] = mapped_column(BigInteger)
    _raw_data_remark: Mapped[Optional[str]] = mapped_column(Text)

    # Relationships
    assignees: Mapped[List["PullRequestAssignee"]] = relationship(back_populates="pull_request")
    comments: Mapped[List["PullRequestComment"]] = relationship(back_populates="pull_request")
    commits: Mapped[List["PullRequestCommit"]] = relationship(back_populates="pull_request")
    issues: Mapped[List["PullRequestIssue"]] = relationship(back_populates="pull_request")
    labels: Mapped[List["PullRequestLabel"]] = relationship(back_populates="pull_request")
    reviewers: Mapped[List["PullRequestReviewer"]] = relationship(back_populates="pull_request")


class PullRequestAssignee(Base):
    __tablename__ = "pull_request_assignees"

    pull_request_id: Mapped[str] = mapped_column(String(255), ForeignKey("pull_requests.id"), primary_key=True)
    assignee_id: Mapped[str] = mapped_column(String(255), primary_key=True)
    name: Mapped[Optional[str]] = mapped_column(String(255))
    user_name: Mapped[Optional[str]] = mapped_column(String(255))
    created_at: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    updated_at: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    _raw_data_params: Mapped[Optional[str]] = mapped_column(String(255))
    _raw_data_table: Mapped[Optional[str]] = mapped_column(String(255))
    _raw_data_id: Mapped[Optional[int]] = mapped_column(BigInteger)
    _raw_data_remark: Mapped[Optional[str]] = mapped_column(Text)

    # Relationship
    pull_request: Mapped["PullRequest"] = relationship(back_populates="assignees")


class PullRequestComment(Base):
    __tablename__ = "pull_request_comments"

    id: Mapped[str] = mapped_column(String(255), primary_key=True)
    body: Mapped[Optional[str]] = mapped_column(Text)
    account_id: Mapped[Optional[str]] = mapped_column(String(255))
    created_date: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    commit_sha: Mapped[Optional[str]] = mapped_column(String(255))
    type: Mapped[Optional[str]] = mapped_column(String(255))
    review_id: Mapped[Optional[str]] = mapped_column(String(255))
    status: Mapped[Optional[str]] = mapped_column(String(255))
    pull_request_id: Mapped[Optional[str]] = mapped_column(String(191), ForeignKey("pull_requests.id"))
    created_at: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    updated_at: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    _raw_data_params: Mapped[Optional[str]] = mapped_column(String(255))
    _raw_data_table: Mapped[Optional[str]] = mapped_column(String(255))
    _raw_data_id: Mapped[Optional[int]] = mapped_column(BigInteger)
    _raw_data_remark: Mapped[Optional[str]] = mapped_column(Text)

    # Relationship
    pull_request: Mapped["PullRequest"] = relationship(back_populates="comments")


class PullRequestCommit(Base):
    __tablename__ = "pull_request_commits"

    commit_sha: Mapped[str] = mapped_column(String(40), primary_key=True)
    pull_request_id: Mapped[str] = mapped_column(String(255), ForeignKey("pull_requests.id"), primary_key=True)
    commit_author_name: Mapped[Optional[str]] = mapped_column(String(255))
    commit_author_email: Mapped[Optional[str]] = mapped_column(String(255))
    commit_authored_date: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    created_at: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    updated_at: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    _raw_data_params: Mapped[Optional[str]] = mapped_column(String(255))
    _raw_data_table: Mapped[Optional[str]] = mapped_column(String(255))
    _raw_data_id: Mapped[Optional[int]] = mapped_column(BigInteger)
    _raw_data_remark: Mapped[Optional[str]] = mapped_column(Text)

    # Relationship
    pull_request: Mapped["PullRequest"] = relationship(back_populates="commits")


class PullRequestIssue(Base):
    __tablename__ = "pull_request_issues"

    pull_request_id: Mapped[str] = mapped_column(String(255), ForeignKey("pull_requests.id"), primary_key=True)
    issue_id: Mapped[str] = mapped_column(String(255), primary_key=True)
    pull_request_key: Mapped[Optional[int]] = mapped_column(BigInteger)
    issue_key: Mapped[Optional[str]] = mapped_column(String(255))
    created_at: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    updated_at: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    _raw_data_params: Mapped[Optional[str]] = mapped_column(String(255))
    _raw_data_table: Mapped[Optional[str]] = mapped_column(String(255))
    _raw_data_id: Mapped[Optional[int]] = mapped_column(BigInteger)
    _raw_data_remark: Mapped[Optional[str]] = mapped_column(Text)

    # Relationship
    pull_request: Mapped["PullRequest"] = relationship(back_populates="issues")


class PullRequestLabel(Base):
    __tablename__ = "pull_request_labels"

    pull_request_id: Mapped[str] = mapped_column(String(255), ForeignKey("pull_requests.id"), primary_key=True)
    label_name: Mapped[str] = mapped_column(String(255), primary_key=True)
    created_at: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    updated_at: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    _raw_data_params: Mapped[Optional[str]] = mapped_column(String(255))
    _raw_data_table: Mapped[Optional[str]] = mapped_column(String(255))
    _raw_data_id: Mapped[Optional[int]] = mapped_column(BigInteger)
    _raw_data_remark: Mapped[Optional[str]] = mapped_column(Text)

    # Relationship
    pull_request: Mapped["PullRequest"] = relationship(back_populates="labels")


class PullRequestReviewer(Base):
    __tablename__ = "pull_request_reviewers"

    pull_request_id: Mapped[str] = mapped_column(String(255), ForeignKey("pull_requests.id"), primary_key=True)
    reviewer_id: Mapped[str] = mapped_column(String(255), primary_key=True)
    name: Mapped[Optional[str]] = mapped_column(String(255))
    user_name: Mapped[Optional[str]] = mapped_column(String(255))
    created_at: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    updated_at: Mapped[Optional[datetime]] = mapped_column(MYSQL_DATETIME(fsp=3))
    _raw_data_params: Mapped[Optional[str]] = mapped_column(String(255))
    _raw_data_table: Mapped[Optional[str]] = mapped_column(String(255))
    _raw_data_id: Mapped[Optional[int]] = mapped_column(BigInteger)
    _raw_data_remark: Mapped[Optional[str]] = mapped_column(Text)

    # Relationship
    pull_request: Mapped["PullRequest"] = relationship(back_populates="reviewers")