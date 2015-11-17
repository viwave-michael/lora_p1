class GroupDevicesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @devices = @group.devices
  end

  def new
    @group = Group.find(params[:group_id])
    @devices = Device.all - @group.devices
  end

  def create
    group = Group.find(params[:group_id])
    device = Device.find(params[:device_id])
    group.devices << device
    group.save
    redirect_to groups_url
  end

  def remove
    @group = Group.find(params[:group_id])
    @devices = @group.devices
  end

  def destroy
    group = Group.find(params[:group_id])
    device = Device.find(params[:device_id])
    group.devices.delete(device)
    group.save
    redirect_to groups_url
  end
end
