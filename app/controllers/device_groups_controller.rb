class DeviceGroupsController < ApplicationController
  def index
    @device = Device.find(params[:device_id])
    @groups = @device.groups
  end

  def new
    @device = Device.find(params[:device_id])
    @groups = Group.all - @device.groups
  end

  def create
    device = Device.find(params[:device_id])
    group = Group.find(params[:group_id])
    device.groups << group
    device.save
    redirect_to devices_url
  end

  def remove
    @device = Device.find(params[:device_id])
    @groups = @device.groups
  end

  def destroy
    device = Device.find(params[:device_id])
    group = Group.find(params[:group_id])
    device.groups.delete(group)
    device.save
    redirect_to devices_url
  end
end
