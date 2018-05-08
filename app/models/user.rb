class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :lists
  has_many :favorites
  validates_presence_of :name
  before_update :user_name
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable


  private
  def user_name
    nome = self.name
    if nome.length>35
      # self.name = nome[0..nome.index(' ')-1] # PARA SALVAR SOMENTE O PRIMEIRO NOME!
      nome = nome.split
      last_name = nome.length-2 # PEGANDO O ULTIMO ESPAÇO!
      nome = nome[0..last_name].join(" ")
      nome.length>35 ? nome= nome[0..34] : nome
      self.name = nome
    end
  end
end
