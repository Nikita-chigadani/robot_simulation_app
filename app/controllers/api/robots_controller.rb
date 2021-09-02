class Api::RobotsController < ApplicationController
    def orders
        str =params[:input]
        # puts "enter the robot commands"
        # str=gets.chomp
        array=str.split(" ")
        if(array[0]== "PLACE")
             
        
            myarray=[]
            co=array[1].split(",")
            x=co[0].to_i
            y=co[1].to_i
            
            if x & y == 0..4 
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
                        if array[array.length-1] == "REPORT"
                            a = []
                            a.push(x,y,array[i])
                            # puts "#{x},#{y}, #{array[i]}"
                            render json: a ,status: :ok
                        end
                
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
                        if array[array.length-1] == "REPORT"
                            a = []
                            a.push(x,y,array[i])
                            # puts "#{x},#{y}, #{array[i]}"
                            render json: a ,status: :ok
                        end
                
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
                        if array[array.length-1] == "REPORT"
                            a = []
                            a.push(x,y,array[i])
                            # puts "#{x},#{y}, #{array[i]}"
                            render json: a ,status: :ok
                        end
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
                        if array[array.length-1] == "REPORT"
                            a = []
                            a.push(x,y,array[i])
                            # puts "#{x},#{y}, #{array[i]}"
                            render json: a ,status: :ok
                        end
                    
                    end
                    
                end
                
            end
        end 
    end
end
