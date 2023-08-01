import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/shared/components/components.dart';
import 'package:todo_app/shared/cubit/cubit.dart';
import 'package:todo_app/shared/cubit/states.dart';

class archive_tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppState>(

        listener: (context,state)=>{},
        builder:(context,state) {
          var tasks = AppCubit.get(context).archiveTasks;
          return ConditionalBuilder(
              condition: tasks.length>0,
              builder: (context)=>ListView.separated(
                itemBuilder: (context, index) => BUILDITEMTASKS(tasks[index],context),
                separatorBuilder: (context, index) =>
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(

                        width: double.infinity,
                        height: 1.0,
                        color: Colors.grey,
                      ),
                    ), itemCount: tasks.length,

              ),
              fallback: (context)=>Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.menu,color: Colors.black12,size: 200,),
                    Text('no tasks until now',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black12),),
                  ],
                ),
              ));
        }
    );
  }
}

