class ProtospacesController < ApplicationController
  def index
    @protospaces = Protospace.all
  end
end
