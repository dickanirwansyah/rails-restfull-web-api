module Api
    module V1
        class ArticlesController < ApplicationController
            def index
                articles = Article.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'Loaded articles', data:articles},
                status: :ok
            end

            def show    
                articles = Article.find(params[:id]);
                render json: {status: 'SUCCESS', message: 'Loaded articles byid', data:articles},
                status: :ok
            end

            def create
               article = Article.new(article_params)
                
               if article.save
                 render json: {status: 'CREATE', message: 'articles successfully', data:article},
                 status: :ok
               else
                 render json: {status: 'ERROR', message: 'article not saved', data:article.errors},
                 status: :unprocessable_entity
               end
            end

            private def article_params
                params.permit(:title, :body)
            end
        end
    end
end