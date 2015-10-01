class GroupsController < AuthenticatedController
  respond_to :json

  api :GET, '/groups', 'List groups'
  def index
    groups = Group.all.order(id: :desc)
    render json: groups
  end

  api :POST, '/groups', 'Create a group'
  def create
    group = Group.create(group_params)
    group.add_admin(current_user)
    render json: [group]
  end

  api :GET, '/groups/:id', 'Full details of group'
  def show
    group = Group.find(params[:id])
    if current_user.is_member_of?(group)
      render json: [group]
    else
      render status: 401
    end
  end

  api :PATCH, '/groups/:id', 'Update a group'
  def update
    group = Group.find(params[:id])
    group.update(group_params)
    render json: [group]
  end

  private
    def group_params
      params.require(:group).permit(:name, :currency_code)
    end
end