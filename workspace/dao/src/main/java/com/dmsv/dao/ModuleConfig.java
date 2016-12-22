package com.dmsv.dao;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="module_config")
public class ModuleConfig {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	private Integer moduleId;
	private String moduleName;
	private String moduleGroup;
	private Integer moduleOrder;
	private String fieldName;
	private String fieldDataType;
	private Integer fieldSize;
	private Integer fieldAlignOrder;

	public Integer getModuleId() {
		return moduleId;
	}
	public void setModuleId(Integer moduleId) {
		this.moduleId = moduleId;
	}
	public String getModuleName() {
		return moduleName;
	}
	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}
	public String getModuleGroup() {
		return moduleGroup;
	}
	public void setModuleGroup(String moduleGroup) {
		this.moduleGroup = moduleGroup;
	}
	public Integer getModuleOrder() {
		return moduleOrder;
	}
	public void setModuleOrder(Integer moduleOrder) {
		this.moduleOrder = moduleOrder;
	}
	public String getFieldName() {
		return fieldName;
	}
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	public String getFieldDataType() {
		return fieldDataType;
	}
	public void setFieldDataType(String fieldDataType) {
		this.fieldDataType = fieldDataType;
	}
	public Integer getFieldSize() {
		return fieldSize;
	}
	public void setFieldSize(Integer fieldSize) {
		this.fieldSize = fieldSize;
	}
	public Integer getFieldAlignOrder() {
		return fieldAlignOrder;
	}
	public void setFieldAlignOrder(Integer fieldAlignOrder) {
		this.fieldAlignOrder = fieldAlignOrder;
	}

}

