class Api::RobotsController < ApplicationController
    def orders
        
        str = params[:command]
        array=str.split(" ")
        execute(array)
    end

    private

    def execute(array)
        if(array[0]== "PLACE")
            
            co=array[1].split(",")
            x=co[0].to_i
            y=co[1].to_i

            if x < 5 && x >= 0 && y < 5 && y >= 0
                for i in (2...array.length)
                    if array[i] == "NORTH"

                        for j in (2...array.length)
                        
                        if array[j] == "MOVE"
                            y=y+1
                            j=j+1
                                if array[j] == "MOVE"
                                    y=y+1
                                    break
                                end
                                break
                        end
                        end
                        
                        for s in (2...array.length)
                            if array[s] == "LEFT"
                                array[i] ="WEST"
                                s=s+1
                                if array[s] == "MOVE"
                                    x=x-1
                                end
                            elsif array[s] == "RIGHT"
                                array[i] = "EAST"  
                                s=s+1
                                if array[s] == "MOVE"
                                    x=x+1
                                end  
                            end
                        end
                        print_result(x,y,array[i]) if array[array.length-1] == "REPORT"
                
                    elsif array[i] == "EAST"
                        for j in (2...array.length)
                        
                            if array[j] == "MOVE"
                                x=x+1
                                j=j+1
                                if array[j] == "MOVE"
                                    x=x+1
                                    break
                                end
                                break
                            end
                            
                        end
                        for s in (2...array.length)
                            if array[s] == "LEFT"
                                array[i] ="NORTH"
                                s=s+1
                                if array[s]== "MOVE"
                                    y=y+1
                                end
                            elsif array[s]== "RIGHT"
                                array[i] = "SOUTH" 
                                s=s+1
                                if array[s]== "MOVE"
                                    y=y-1
                                end  
                            end
                        end
                        print_result(x,y,array[i]) if array[array.length-1] == "REPORT"
                
                    elsif array[i]== "SOUTH"
                        for j in (2...array.length)
                                if array[j] == "MOVE" 
                                    y=y-1
                                    j=j+1
                                if array[j] == "MOVE"
                                    y=y-1
                                    break
                                end
                                break
                                    
                                end
                        end   
                        for s in (2...array.length)   
                            if array[s] == "LEFT"
                                array[i] ="EAST"
                                s=s+1
                                if array[s] == "MOVE"
                                    x=x+1
                                end
                            elsif array[s]== "RIGHT"
                                array[i] = "WEST"  
                                s=s+1
                                if array[s]== "MOVE"
                                    x=x-1
                                end  
                            end
                        end
                        print_result(x,y,array[i]) if array[array.length-1] == "REPORT"
                    elsif array[i]== "WEST"
                        for j in (2...array.length)
                            if array[j]== "MOVE"
                                x=x-1
                                j=j+1
                                if array[j] == "MOVE"
                                    x=x-1
                                    break
                                end
                                break
                                
                            end
                        end
                        for s in (2...array.length)
                            if array[s] == "LEFT"
                                array[i] ="SOUTH"
                                s=s+1
                                if array[s] == "MOVE"
                                    y=y-1
                                end
                            elsif array[s] == "RIGHT"
                                array[i] = "NORTH"
                                s=s+1
                                if array[s] == "MOVE"
                                    y=y+1
                                end    
                            end
                        end
                        
                        print_result(x,y,array[i]) if array[array.length-1] == "REPORT"
                            
                        
                    
                    end
                    
                end
            
            
            else

                render json: {message: "robot not placed on the table "}, status: :unprocessable_entity  
            end    
            




    end
    end
    def print_result(x,y,face)
        a = []
        a.push(x,y,face)
        render json: a ,status: :ok
    end
end
